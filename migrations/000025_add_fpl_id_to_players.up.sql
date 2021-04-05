BEGIN;

ALTER TABLE IF EXISTS players ADD COLUMN fpl_id INT UNIQUE;

CREATE INDEX idx_players_fpl_id ON players (fpl_id);

COMMIT;
