BEGIN;

DROP INDEX IF EXISTS idx_competitions_football_data_plan;

ALTER TABLE competitions
DROP COLUMN IF EXISTS football_data_id,
DROP COLUMN IF EXISTS football_data_plan;

COMMIT;
