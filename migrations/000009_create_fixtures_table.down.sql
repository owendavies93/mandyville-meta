BEGIN;

DROP INDEX IF EXISTS idx_fixtures_competition_id_season;

DROP INDEX IF EXISTS idx_fixtures_season;

DROP INDEX IF EXISTS idx_fixtures_away_team_id;

DROP INDEX IF EXISTS idx_fixtures_home_team_id;

DROP TABLE IF EXISTS fixtures;

COMMIT;
