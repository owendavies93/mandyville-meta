CREATE TABLE IF NOT EXISTS fpl_draft_sync_runs (
    id INT GENERATED ALWAYS AS IDENTITY,
    league_id INT,
    run_time TIMESTAMPTZ NOT NULL DEFAULT now(),
    source TEXT NOT NULL,
    endpoints TEXT,
    changes INT NOT NULL DEFAULT 0,
    succeeded BOOLEAN NOT NULL DEFAULT true,
    notes TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_sync_runs_league_id
        FOREIGN KEY (league_id) REFERENCES fpl_draft_leagues(id)
);

CREATE INDEX idx_fpl_draft_sync_runs_league_id_run_time
    ON fpl_draft_sync_runs (league_id, run_time);
