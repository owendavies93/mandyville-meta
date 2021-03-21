CREATE TABLE IF NOT EXISTS players_fixtures (
    id INT GENERATED ALWAYS AS IDENTITY,
    player_id INT NOT NULL,
    fixture_id INT NOT NULL,
    team_id INT NOT NULL,
    minutes SMALLINT NOT NULL DEFAULT 0,
    yellow_card BOOLEAN NOT NULL DEFAULT FALSE,
    red_card BOOLEAN NOT NULL DEFAULT FALSE,
    goals SMALLINT DEFAULT NULL,
    assists SMALLINT DEFAULT NULL,
    key_passes SMALLINT DEFAULT NULL,
    xg NUMERIC(6, 4) DEFAULT NULL,
    xa NUMERIC(6, 4) DEFAULT NULL,
    xg_buildup NUMERIC(6, 4) DEFAULT NULL,
    xg_chain NUMERIC(6, 4) DEFAULT NULL,
    PRIMARY KEY (id), 
    CONSTRAINT players_fixtures_player_id
        FOREIGN KEY (player_id) REFERENCES players(id),
    CONSTRAINT players_fixtures_fixture_id
        FOREIGN KEY (fixture_id) REFERENCES fixtures(id),
    CONSTRAINT players_fixtures_team_id
        FOREIGN KEY (team_id) REFERENCES teams(id)
);
