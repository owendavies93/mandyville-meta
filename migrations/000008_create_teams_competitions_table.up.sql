BEGIN;

CREATE TABLE IF NOT EXISTS teams_competitions (
    id INT GENERATED ALWAYS AS IDENTITY,
    team_id INT NOT NULL,
    competition_id INT NOT NULL,
    season SMALLINT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT teams_competitions_team_id
     FOREIGN KEY (team_id) REFERENCES teams(id),
    CONSTRAINT teams_competitions_competition_id
     FOREIGN KEY (competition_id) REFERENCES competitions(id)
);

CREATE INDEX idx_teams_competitions_team_id ON teams_competitions(team_id);

CREATE INDEX idx_teams_competitions_competition_id_season ON teams_competitions(competition_id, season);

COMMIT;
