BEGIN;

ALTER TABLE competitions
ADD COLUMN IF NOT EXISTS football_data_id INT,
ADD COLUMN IF NOT EXISTS football_data_plan INT;

CREATE INDEX idx_competitions_football_data_plan ON competitions(football_data_plan);

COMMIT;
