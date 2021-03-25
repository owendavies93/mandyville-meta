BEGIN;

DROP INDEX IF EXISTS idx_players_fixtures_position_id;

ALTER TABLE players_fixtures DROP COLUMN IF EXISTS position_id;

COMMIT;
