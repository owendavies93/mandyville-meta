BEGIN;

ALTER TABLE players ADD COLUMN IF NOT EXISTS understat_id INT;

CREATE INDEX idx_players_understat_id ON players(understat_id);

COMMIT;
