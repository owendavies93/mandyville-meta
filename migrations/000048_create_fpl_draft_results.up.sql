BEGIN;

CREATE TABLE IF NOT EXISTS fpl_draft_matches (
    id INT GENERATED ALWAYS AS IDENTITY,
    league_id INT NOT NULL,
    event SMALLINT NOT NULL,
    home_draft_entry_id INT NOT NULL,
    away_draft_entry_id INT NOT NULL,
    home_points SMALLINT NOT NULL DEFAULT 0,
    away_points SMALLINT NOT NULL DEFAULT 0,
    finished BOOLEAN NOT NULL DEFAULT false,
    started BOOLEAN NOT NULL DEFAULT false,
    winning_draft_entry_id INT,
    winning_method TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_matches_league_id
        FOREIGN KEY (league_id) REFERENCES fpl_draft_leagues(id),
    CONSTRAINT fpl_draft_matches_home_draft_entry_id
        FOREIGN KEY (home_draft_entry_id) REFERENCES fpl_draft_entries(id),
    CONSTRAINT fpl_draft_matches_away_draft_entry_id
        FOREIGN KEY (away_draft_entry_id) REFERENCES fpl_draft_entries(id),
    CONSTRAINT fpl_draft_matches_winning_draft_entry_id
        FOREIGN KEY (winning_draft_entry_id) REFERENCES fpl_draft_entries(id),
    CONSTRAINT fpl_draft_matches_league_id_event_home_draft_entry_id
        UNIQUE (league_id, event, home_draft_entry_id)
);

-- The draft API's standings payload is the current overall league table,
-- not a per-gameweek history. Per-gameweek standings can be reconstructed
-- from fpl_draft_matches later.
CREATE TABLE IF NOT EXISTS fpl_draft_standings (
    id INT GENERATED ALWAYS AS IDENTITY,
    league_id INT NOT NULL,
    draft_entry_id INT NOT NULL,
    rank SMALLINT,
    last_rank SMALLINT,
    points_for INT NOT NULL DEFAULT 0,
    points_against INT NOT NULL DEFAULT 0,
    matches_played SMALLINT NOT NULL DEFAULT 0,
    matches_won SMALLINT NOT NULL DEFAULT 0,
    matches_drawn SMALLINT NOT NULL DEFAULT 0,
    matches_lost SMALLINT NOT NULL DEFAULT 0,
    total SMALLINT NOT NULL DEFAULT 0,
    recorded_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_standings_league_id
        FOREIGN KEY (league_id) REFERENCES fpl_draft_leagues(id),
    CONSTRAINT fpl_draft_standings_draft_entry_id
        FOREIGN KEY (draft_entry_id) REFERENCES fpl_draft_entries(id),
    CONSTRAINT fpl_draft_standings_league_id_draft_entry_id
        UNIQUE (league_id, draft_entry_id)
);

COMMIT;
