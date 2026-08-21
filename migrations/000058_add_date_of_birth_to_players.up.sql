BEGIN;

ALTER TABLE players ADD COLUMN IF NOT EXISTS date_of_birth DATE;

CREATE INDEX IF NOT EXISTS idx_players_date_of_birth
    ON players (date_of_birth);

COMMIT;
