BEGIN;

ALTER TABLE IF EXISTS fixtures ALTER COLUMN home_team_goals DROP NOT NULL;
ALTER TABLE IF EXISTS fixtures ALTER COLUMN away_team_goals DROP NOT NULL;

COMMIT;