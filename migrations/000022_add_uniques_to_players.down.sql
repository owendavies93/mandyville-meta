BEGIN;

ALTER TABLE players DROP CONSTRAINT IF EXISTS players_football_data_id;

ALTER TABLE players DROP CONSTRAINT IF EXISTS players_understat_id;

COMMIT;
