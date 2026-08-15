BEGIN;

ALTER TABLE IF EXISTS fixtures DROP CONSTRAINT IF EXISTS fixtures_team_competition_season;

ALTER TABLE IF EXISTS fixtures ADD CONSTRAINT fixtures_team_competition_season_date
    UNIQUE (competition_id, home_team_id, away_team_id, season, fixture_date);

COMMIT;
