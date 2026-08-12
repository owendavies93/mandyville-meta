CREATE TABLE IF NOT EXISTS fpl_unmatched_players (
    id INT GENERATED ALWAYS AS IDENTITY,
    fpl_code INT NOT NULL,
    first_name TEXT NOT NULL,
    second_name TEXT NOT NULL,
    web_name TEXT NOT NULL,
    season SMALLINT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fpl_unmatched_players_code_season
        UNIQUE (fpl_code, season)
);
