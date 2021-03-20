BEGIN;

DROP INDEX IF EXISTS idx_players_football_data_id;

ALTER TABLE players DROP COLUMN IF EXISTS football_data_id;

COMMIT;
