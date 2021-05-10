#!/bin/sh
#
# get-test-data.sh
# =========
# Fetches a minimal amount of test data from a specified database, as
# defined in the config file passed as the first argument to the
# script. The test data fetched should be enough to populate a test
# database to run integration tests against.
# Requires:
#   * yq
#   * pg_dump
#   * psql

CONFIG=$1

if [ -z "$CONFIG" ]; then
    echo "Needs a config file path as first argument"
    exit 1
fi

USER=$(yq e '.database.write_user' $CONFIG)
HOST=$(yq e '.database.host' $CONFIG)
DB=$(yq e '.database.db' $CONFIG)

OUTPUT_FILE="test_data.sql"

start_output() {
    echo "COPY public.$1 FROM stdin;" >> $OUTPUT_FILE
}

end_output() {
    echo "\." >> $OUTPUT_FILE
}

output_query_result() {
    psql -h $HOST -U $USER $DB -c "COPY ($1) TO STDOUT" >> $OUTPUT_FILE
}

echo "Dumping $DB to $OUTPUT_FILE"

export PGPASSWORD=$(yq e '.database.pass' $CONFIG)

# Get some base tables that have fairly fixed content and are small
pg_dump -d $DB -h $HOST -U $USER -a -t countries -t competitions \
-t fpl_gameweeks -t positions -t fpl_positions --no-comments > $OUTPUT_FILE

# Generate some player IDs
PLAYER_IDS=$(psql $DB -h $HOST -U $USER -t -c \
"SELECT player_id FROM fpl_season_info ORDER BY RANDOM() LIMIT 10" \
| xargs | tr ' ' ,)

# Get data for those players
start_output "players (id, first_name, last_name, country_id, \
football_data_id, understat_id, fpl_id)"

output_query_result "SELECT * FROM players WHERE id IN ($PLAYER_IDS)"

end_output

start_output "fpl_players_gameweeks (id, player_id, fpl_gameweek_id, \
total_points, bonus_points, bps, value, selected, transfers_in, transfers_out)"

output_query_result "SELECT * FROM fpl_players_gameweeks WHERE player_id IN \
($PLAYER_IDS)"

end_output

start_output "fpl_season_info (id, player_id, season, fpl_season_id, \
fpl_positions_id)"

output_query_result "SELECT * FROM fpl_season_info WHERE player_id IN \
($PLAYER_IDS)"

end_output

# Get the teams for the players
TEAM_IDS=$(psql $DB -h $HOST -U $USER -t -c \
"SELECT team_id FROM players_fixtures WHERE player_id IN ($PLAYER_IDS)" \
| xargs | tr ' ' ,)

# Get all the teams that those teams have ever played
ALL_TEAM_IDS=$(psql $DB -h $HOST -U $USER -t -c \
"SELECT home_team_id FROM fixtures WHERE home_team_id IN ($TEAM_IDS) OR \
away_team_id IN ($TEAM_IDS) UNION SELECT away_team_id FROM fixtures WHERE \
home_team_id IN ($TEAM_IDS) OR away_team_id IN ($TEAM_IDS)" | xargs | tr ' ' ,)

# Get the data for those teams
start_output "teams (id, name, football_data_id)"

output_query_result "SELECT * FROM teams WHERE id IN ($ALL_TEAM_IDS)"

end_output

start_output "teams_competitions (id, team_id, competition_id, season)"

output_query_result "SELECT * FROM teams_competitions WHERE team_id IN \
($ALL_TEAM_IDS)"

end_output

# Get the fixture data for those teams and players
ALL_FIXTURE_IDS=$(psql $DB -h $HOST -U $USER -t -c \
"SELECT id FROM fixtures WHERE home_team_id IN ($ALL_TEAM_IDS) AND \
away_team_id IN ($ALL_TEAM_IDS)" | xargs | tr ' ' ,)

start_output "fixtures (id, competition_id, home_team_id, away_team_id, \
season, winning_team_id, home_team_goals, away_team_goals, fixture_date)"

output_query_result "SELECT * FROM fixtures WHERE home_team_id IN \
($ALL_TEAM_IDS) AND away_team_id IN ($ALL_TEAM_IDS)"

end_output

start_output "players_fixtures (id, player_id, fixture_id, team_id, \
minutes, yellow_card, red_card, goals, assists, key_passes, xg, xa, \
xg_buildup, xg_chain, position_id, npg, npxg)"

output_query_result "SELECT * FROM players_fixtures WHERE player_id IN \
($PLAYER_IDS)"

end_output

echo "Done"
