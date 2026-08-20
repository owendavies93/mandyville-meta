BEGIN;

CREATE TABLE IF NOT EXISTS fpl_classic_entries (
    id INT GENERATED ALWAYS AS IDENTITY,
    fpl_entry_id INT NOT NULL,
    season SMALLINT NOT NULL,
    entry_name TEXT,
    player_first_name TEXT,
    player_last_name TEXT,
    started_event SMALLINT,
    is_mine BOOLEAN NOT NULL DEFAULT false,
    PRIMARY KEY (id),
    CONSTRAINT fpl_classic_entries_entry_id_season UNIQUE (fpl_entry_id, season)
);

COMMIT;
