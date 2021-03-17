BEGIN;

CREATE TABLE fixtures (
    id INT GENERATED ALWAYS AS IDENTITY,
    competition_id INT NOT NULL,
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL,
    season SMALLINT NOT NULL,
    winning_team_id INT,
    home_team_goals SMALLINT NOT NULL DEFAULT 0,
    away_team_goals SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    CONSTRAINT fixtures_competition_id
     FOREIGN KEY (competition_id) REFERENCES competitions (id),
    CONSTRAINT fixtures_home_team_id
     FOREIGN KEY (home_team_id) REFERENCES teams (id),
    CONSTRAINT fixtures_away_team_id
     FOREIGN KEY (away_team_id) REFERENCES teams (id),
    CONSTRAINT fixtures_winning_team_id
     FOREIGN KEY (winning_team_id) REFERENCES teams (id)
);

CREATE INDEX idx_fixtures_home_team_id ON fixtures (home_team_id);

CREATE INDEX idx_fixtures_away_team_id ON fixtures (away_team_id);

CREATE INDEX idx_fixtures_season ON fixtures (season);

CREATE INDEX idx_fixtures_competition_id_season ON fixtures (competition_id, season);

COMMIT;
