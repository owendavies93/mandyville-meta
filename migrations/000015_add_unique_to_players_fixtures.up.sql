ALTER TABLE IF EXISTS players_fixtures ADD CONSTRAINT players_fixtures_player_fixture_team UNIQUE (player_id, fixture_id, team_id);
