BEGIN;

CREATE TABLE IF NOT EXISTS fpl_draft_entries (
    id INT GENERATED ALWAYS AS IDENTITY,
    league_id INT NOT NULL,
    entry_id INT NOT NULL,
    league_entry_id INT NOT NULL,
    entry_name TEXT NOT NULL,
    player_first_name TEXT,
    player_last_name TEXT,
    short_name TEXT,
    is_mine BOOLEAN NOT NULL DEFAULT false,
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_entries_league_id
        FOREIGN KEY (league_id) REFERENCES fpl_draft_leagues(id),
    CONSTRAINT fpl_draft_entries_league_id_entry_id
        UNIQUE (league_id, entry_id),
    CONSTRAINT fpl_draft_entries_league_id_league_entry_id
        UNIQUE (league_id, league_entry_id)
);

CREATE TABLE IF NOT EXISTS fpl_draft_waiver_order (
    id INT GENERATED ALWAYS AS IDENTITY,
    draft_entry_id INT NOT NULL,
    waiver_pick SMALLINT NOT NULL,
    start_time TIMESTAMPTZ NOT NULL DEFAULT now(),
    end_time TIMESTAMPTZ,
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_waiver_order_draft_entry_id
        FOREIGN KEY (draft_entry_id) REFERENCES fpl_draft_entries(id)
);

CREATE UNIQUE INDEX fpl_draft_waiver_order_draft_entry_id_open
    ON fpl_draft_waiver_order (draft_entry_id)
    WHERE end_time IS NULL;

COMMIT;
