BEGIN;

ALTER TABLE players ADD COLUMN IF NOT EXISTS football_data_id INT;

CREATE INDEX idx_players_football_data_id ON players(football_data_id);

COMMIT;
