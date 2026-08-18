BEGIN;

CREATE TABLE IF NOT EXISTS fpl_projection_runs (
    id INT GENERATED ALWAYS AS IDENTITY,
    season SMALLINT NOT NULL,
    run_time TIMESTAMPTZ NOT NULL DEFAULT now(),
    kind TEXT NOT NULL,
    as_of_gameweek SMALLINT,
    scoring TEXT NOT NULL,
    engine_version TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS fpl_projections (
    id INT GENERATED ALWAYS AS IDENTITY,
    run_id INT NOT NULL,
    player_id INT NOT NULL,
    team_id INT,
    projected_minutes NUMERIC(10, 2),
    xg_per_90 NUMERIC(8, 4),
    xa_per_90 NUMERIC(8, 4),
    yellows_per_90 NUMERIC(8, 4),
    reds_per_90 NUMERIC(8, 4),
    bonus_per_match NUMERIC(8, 4),
    minutes_per_fixture NUMERIC(8, 4),
    projected_goals NUMERIC(8, 4),
    projected_assists NUMERIC(8, 4),
    projected_clean_sheets NUMERIC(8, 4),
    projected_bonus NUMERIC(8, 4),
    projected_yellows NUMERIC(8, 4),
    projected_reds NUMERIC(8, 4),
    projected_defcon NUMERIC(8, 4),
    appearance_points NUMERIC(10, 3),
    goal_points NUMERIC(10, 3),
    assist_points NUMERIC(10, 3),
    clean_sheet_points NUMERIC(10, 3),
    save_points NUMERIC(10, 3),
    bonus_points NUMERIC(10, 3),
    card_points NUMERIC(10, 3),
    goals_conceded_penalty NUMERIC(10, 3),
    defcon_points NUMERIC(10, 3),
    projected_points NUMERIC(10, 3),
    consistency NUMERIC(8, 3),
    floor NUMERIC(8, 3),
    h2h_adjusted_points NUMERIC(10, 3),
    vorp NUMERIC(10, 3),
    PRIMARY KEY (id),
    CONSTRAINT fpl_projections_run_id
        FOREIGN KEY (run_id) REFERENCES fpl_projection_runs(id),
    CONSTRAINT fpl_projections_player_id
        FOREIGN KEY (player_id) REFERENCES players(id),
    CONSTRAINT fpl_projections_run_id_player_id
        UNIQUE (run_id, player_id)
);

COMMIT;
