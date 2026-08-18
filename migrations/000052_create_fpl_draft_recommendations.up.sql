BEGIN;

CREATE TABLE IF NOT EXISTS fpl_draft_recommendation_runs (
    id INT GENERATED ALWAYS AS IDENTITY,
    league_id INT NOT NULL,
    draft_entry_id INT NOT NULL,
    run_time TIMESTAMPTZ NOT NULL DEFAULT now(),
    event SMALLINT NOT NULL,
    horizon SMALLINT NOT NULL,
    discount NUMERIC(4, 3) NOT NULL,
    projection_run_id INT,
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_recommendation_runs_league_id
        FOREIGN KEY (league_id) REFERENCES fpl_draft_leagues(id),
    CONSTRAINT fpl_draft_recommendation_runs_draft_entry_id
        FOREIGN KEY (draft_entry_id) REFERENCES fpl_draft_entries(id),
    CONSTRAINT fpl_draft_recommendation_runs_projection_run_id
        FOREIGN KEY (projection_run_id) REFERENCES fpl_projection_runs(id)
);

CREATE TABLE IF NOT EXISTS fpl_draft_recommendations (
    id INT GENERATED ALWAYS AS IDENTITY,
    run_id INT NOT NULL,
    player_in_id INT,
    player_out_id INT,
    element_in SMALLINT,
    element_out SMALLINT,
    position TEXT NOT NULL,
    kind TEXT NOT NULL,
    expected_gain NUMERIC(10, 3) NOT NULL,
    undiscounted_gain NUMERIC(10, 3) NOT NULL,
    h2h_gain NUMERIC(10, 3),
    success_probability NUMERIC(6, 4),
    claim_order SMALLINT,
    recommended BOOLEAN NOT NULL DEFAULT true,
    PRIMARY KEY (id),
    CONSTRAINT fpl_draft_recommendations_run_id
        FOREIGN KEY (run_id) REFERENCES fpl_draft_recommendation_runs(id),
    CONSTRAINT fpl_draft_recommendations_player_in_id
        FOREIGN KEY (player_in_id) REFERENCES players(id),
    CONSTRAINT fpl_draft_recommendations_player_out_id
        FOREIGN KEY (player_out_id) REFERENCES players(id)
);

CREATE INDEX idx_fpl_draft_recommendation_runs_league_id_run_time
    ON fpl_draft_recommendation_runs (league_id, run_time);

CREATE INDEX idx_fpl_draft_recommendations_run_id
    ON fpl_draft_recommendations (run_id);

COMMIT;
