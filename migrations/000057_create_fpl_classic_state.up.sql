BEGIN;

CREATE TABLE IF NOT EXISTS fpl_classic_entry_history (
    id INT GENERATED ALWAYS AS IDENTITY,
    classic_entry_id INT NOT NULL,
    event SMALLINT NOT NULL,
    points SMALLINT,
    total_points INT,
    rank INT,
    overall_rank INT,
    percentile_rank SMALLINT,
    bank SMALLINT,
    value INT,
    event_transfers SMALLINT,
    event_transfers_cost SMALLINT,
    points_on_bench SMALLINT,
    PRIMARY KEY (id),
    CONSTRAINT fpl_classic_entry_history_entry_id
        FOREIGN KEY (classic_entry_id) REFERENCES fpl_classic_entries(id),
    CONSTRAINT fpl_classic_entry_history_entry_event
        UNIQUE (classic_entry_id, event)
);

CREATE TABLE IF NOT EXISTS fpl_classic_picks (
    id INT GENERATED ALWAYS AS IDENTITY,
    classic_entry_id INT NOT NULL,
    event SMALLINT NOT NULL,
    player_id INT,
    fpl_element SMALLINT NOT NULL,
    position SMALLINT NOT NULL,
    multiplier SMALLINT NOT NULL DEFAULT 1,
    is_captain BOOLEAN NOT NULL DEFAULT false,
    is_vice_captain BOOLEAN NOT NULL DEFAULT false,
    active_chip TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fpl_classic_picks_entry_id
        FOREIGN KEY (classic_entry_id) REFERENCES fpl_classic_entries(id),
    CONSTRAINT fpl_classic_picks_player_id
        FOREIGN KEY (player_id) REFERENCES players(id),
    CONSTRAINT fpl_classic_picks_entry_event_position
        UNIQUE (classic_entry_id, event, position)
);

CREATE TABLE IF NOT EXISTS fpl_classic_transfers (
    id INT GENERATED ALWAYS AS IDENTITY,
    classic_entry_id INT NOT NULL,
    event SMALLINT NOT NULL,
    player_in_id INT,
    player_out_id INT,
    element_in SMALLINT NOT NULL,
    element_out SMALLINT NOT NULL,
    element_in_cost SMALLINT,
    element_out_cost SMALLINT,
    transfer_time TIMESTAMPTZ NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fpl_classic_transfers_entry_id
        FOREIGN KEY (classic_entry_id) REFERENCES fpl_classic_entries(id),
    CONSTRAINT fpl_classic_transfers_player_in_id
        FOREIGN KEY (player_in_id) REFERENCES players(id),
    CONSTRAINT fpl_classic_transfers_player_out_id
        FOREIGN KEY (player_out_id) REFERENCES players(id),
    CONSTRAINT fpl_classic_transfers_unique
        UNIQUE (classic_entry_id, event, element_in, element_out, transfer_time)
);

CREATE TABLE IF NOT EXISTS fpl_classic_chips (
    id INT GENERATED ALWAYS AS IDENTITY,
    classic_entry_id INT NOT NULL,
    name TEXT NOT NULL,
    event SMALLINT NOT NULL,
    played_time TIMESTAMPTZ,
    PRIMARY KEY (id),
    CONSTRAINT fpl_classic_chips_entry_id
        FOREIGN KEY (classic_entry_id) REFERENCES fpl_classic_entries(id),
    CONSTRAINT fpl_classic_chips_entry_name_event
        UNIQUE (classic_entry_id, name, event)
);

COMMIT;
