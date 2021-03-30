BEGIN;

CREATE TABLE IF NOT EXISTS team_alternate_names (
    id INT GENERATED ALWAYS AS IDENTITY,
    team_id INT NOT NULL,
    name TEXT NOT NULL UNIQUE,
    PRIMARY KEY (id),
    CONSTRAINT team_alternate_names_team_id
        FOREIGN KEY (team_id) REFERENCES teams(id)
);

CREATE INDEX idx_team_alternate_names_team_id ON team_alternate_names(team_id);

COMMIT;
