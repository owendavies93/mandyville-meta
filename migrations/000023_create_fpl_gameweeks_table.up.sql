BEGIN;

CREATE TABLE IF NOT EXISTS fpl_gameweeks (
    id INT GENERATED ALWAYS AS IDENTITY,
    season SMALLINT NOT NULL,
    gameweek SMALLINT NOT NULL,
    deadline TIMESTAMPTZ NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS fpl_gameweeks
    ADD CONSTRAINT fpl_gameweeks_season_gameweek
    UNIQUE (season, gameweek);

COMMIT;
