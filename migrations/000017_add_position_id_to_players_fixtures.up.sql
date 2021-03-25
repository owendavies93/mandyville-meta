BEGIN;

ALTER TABLE players_fixtures
    ADD COLUMN position_id INT,
    ADD CONSTRAINT players_fixtures_position_id
    FOREIGN KEY (position_id)
    REFERENCES positions (id);

CREATE INDEX idx_players_fixtures_position_id ON players_fixtures (position_id);

COMMIT;
