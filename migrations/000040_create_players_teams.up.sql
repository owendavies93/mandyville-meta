CREATE TABLE IF NOT EXISTS players_teams (
    id         INT GENERATED ALWAYS AS IDENTITY,
    player_id  INT NOT NULL,
    team_id    INT NOT NULL,
    start_date DATE NOT NULL,
    end_date   DATE,
    PRIMARY KEY (id),
    CONSTRAINT players_teams_player_id
        FOREIGN KEY (player_id) REFERENCES players(id),
    CONSTRAINT players_teams_team_id
        FOREIGN KEY (team_id) REFERENCES teams(id)
);

CREATE INDEX idx_players_teams_player_id ON players_teams (player_id);

CREATE UNIQUE INDEX players_teams_one_open_stint
    ON players_teams (player_id) WHERE end_date IS NULL;
