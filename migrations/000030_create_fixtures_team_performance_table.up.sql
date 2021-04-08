CREATE TABLE IF NOT EXISTS fixtures_team_performance (
    id INT GENERATED ALWAYS AS IDENTITY,
    fixture_id INT NOT NULL,
    team_id INT NOT NULL,
    shots SMALLINT NOT NULL,
    shots_on_target SMALLINT NOT NULL,
    xg NUMERIC(6, 4) NOT NULL,
    deep_passes SMALLINT NOT NULL,
    ppda NUMERIC(6, 4) NOT NULL,
    win_chance NUMERIC(6, 4) NOT NULL,
    draw_chance NUMERIC(6, 4) NOT NULL,
    loss_chance NUMERIC(6, 4) NOT NULL,
    xpts NUMERIC(6, 4) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fixtures_team_performance_fixture_id
        FOREIGN KEY (fixture_id) REFERENCES fixtures(id),
    CONSTRAINT fixtures_team_performance_team_id
        FOREIGN KEY (team_id) REFERENCES teams(id),
    CONSTRAINT fixtures_team_performance_fixture_id_team_id
        UNIQUE (fixture_id, team_id)
);
