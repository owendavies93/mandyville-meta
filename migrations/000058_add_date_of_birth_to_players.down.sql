BEGIN;

DROP INDEX IF EXISTS idx_players_date_of_birth;

ALTER TABLE players DROP COLUMN IF EXISTS date_of_birth;

COMMIT;
