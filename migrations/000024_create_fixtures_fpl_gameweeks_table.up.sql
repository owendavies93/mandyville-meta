CREATE TABLE IF NOT EXISTS fixtures_fpl_gameweeks (
    id INT GENERATED ALWAYS AS IDENTITY,
    fixture_id INT NOT NULL UNIQUE,
    gameweek_id INT NOT NULL,
    CONSTRAINT fixtures_fpl_gameweeks_fixture_id
        FOREIGN KEY (fixture_id) REFERENCES fixtures(id),
    CONSTRAINT fixtures_fpl_gameweeks_gameweek_id
        FOREIGN KEY (gameweek_id) REFERENCES fpl_gameweeks(id),
    CONSTRAINT fixtures_fpl_gameweeks_fixture_id_gameweek_id
        UNIQUE (fixture_id, gameweek_id)
);
