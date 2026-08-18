CREATE TABLE IF NOT EXISTS fpl_draft_leagues (
    id INT GENERATED ALWAYS AS IDENTITY,
    fpl_league_id INT NOT NULL,
    season SMALLINT NOT NULL,
    name TEXT NOT NULL,
    scoring TEXT,
    transaction_mode TEXT,
    trades TEXT,
    draft_dt TIMESTAMPTZ,
    start_event SMALLINT,
    stop_event SMALLINT,
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_leagues_fpl_league_id_season
        UNIQUE (fpl_league_id, season)
);
