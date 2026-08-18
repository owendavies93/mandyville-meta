BEGIN;

CREATE TABLE IF NOT EXISTS fpl_draft_picks (
    id INT GENERATED ALWAYS AS IDENTITY,
    league_id INT NOT NULL,
    draft_entry_id INT NOT NULL,
    player_id INT,
    fpl_draft_element SMALLINT NOT NULL,
    draft_id SMALLINT NOT NULL DEFAULT 1,
    round SMALLINT NOT NULL,
    pick SMALLINT NOT NULL,
    pick_index SMALLINT NOT NULL,
    choice_time TIMESTAMPTZ,
    was_auto BOOLEAN NOT NULL DEFAULT false,
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_picks_league_id
        FOREIGN KEY (league_id) REFERENCES fpl_draft_leagues(id),
    CONSTRAINT fpl_draft_picks_draft_entry_id
        FOREIGN KEY (draft_entry_id) REFERENCES fpl_draft_entries(id),
    CONSTRAINT fpl_draft_picks_player_id
        FOREIGN KEY (player_id) REFERENCES players(id),
    CONSTRAINT fpl_draft_picks_league_id_draft_id_pick_index
        UNIQUE (league_id, draft_id, pick_index)
);

CREATE TABLE IF NOT EXISTS fpl_draft_transactions (
    id INT GENERATED ALWAYS AS IDENTITY,
    league_id INT NOT NULL,
    draft_entry_id INT NOT NULL,
    player_in_id INT,
    player_out_id INT,
    element_in SMALLINT,
    element_out SMALLINT,
    kind TEXT,
    result TEXT,
    event SMALLINT,
    added_time TIMESTAMPTZ,
    priority SMALLINT,
    fpl_transaction_id INT,
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_transactions_league_id
        FOREIGN KEY (league_id) REFERENCES fpl_draft_leagues(id),
    CONSTRAINT fpl_draft_transactions_draft_entry_id
        FOREIGN KEY (draft_entry_id) REFERENCES fpl_draft_entries(id),
    CONSTRAINT fpl_draft_transactions_player_in_id
        FOREIGN KEY (player_in_id) REFERENCES players(id),
    CONSTRAINT fpl_draft_transactions_player_out_id
        FOREIGN KEY (player_out_id) REFERENCES players(id),
    CONSTRAINT fpl_draft_transactions_league_id_fpl_transaction_id
        UNIQUE (league_id, fpl_transaction_id)
);

CREATE TABLE IF NOT EXISTS fpl_draft_ownership (
    id INT GENERATED ALWAYS AS IDENTITY,
    league_id INT NOT NULL,
    draft_entry_id INT,
    player_id INT,
    fpl_draft_element SMALLINT NOT NULL,
    status TEXT,
    in_accepted_trade BOOLEAN NOT NULL DEFAULT false,
    start_time TIMESTAMPTZ NOT NULL DEFAULT now(),
    end_time TIMESTAMPTZ,
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_ownership_league_id
        FOREIGN KEY (league_id) REFERENCES fpl_draft_leagues(id),
    CONSTRAINT fpl_draft_ownership_draft_entry_id
        FOREIGN KEY (draft_entry_id) REFERENCES fpl_draft_entries(id),
    CONSTRAINT fpl_draft_ownership_player_id
        FOREIGN KEY (player_id) REFERENCES players(id)
);

CREATE UNIQUE INDEX fpl_draft_ownership_league_id_element_open
    ON fpl_draft_ownership (league_id, fpl_draft_element)
    WHERE end_time IS NULL;

CREATE TABLE IF NOT EXISTS fpl_draft_entry_picks (
    id INT GENERATED ALWAYS AS IDENTITY,
    league_id INT NOT NULL,
    draft_entry_id INT NOT NULL,
    event SMALLINT NOT NULL,
    player_id INT,
    fpl_draft_element SMALLINT NOT NULL,
    position SMALLINT NOT NULL,
    is_starting BOOLEAN NOT NULL DEFAULT false,
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_entry_picks_league_id
        FOREIGN KEY (league_id) REFERENCES fpl_draft_leagues(id),
    CONSTRAINT fpl_draft_entry_picks_draft_entry_id
        FOREIGN KEY (draft_entry_id) REFERENCES fpl_draft_entries(id),
    CONSTRAINT fpl_draft_entry_picks_player_id
        FOREIGN KEY (player_id) REFERENCES players(id),
    CONSTRAINT fpl_draft_entry_picks_league_id_entry_event_position
        UNIQUE (league_id, draft_entry_id, event, position)
);

COMMIT;
