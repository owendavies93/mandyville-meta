BEGIN;

ALTER TABLE players DROP INDEX IF EXISTS idx_players_understat_id;

ALTER TABLE players DROP COLUMN IF EXISTS understat_id;

COMMIT;
