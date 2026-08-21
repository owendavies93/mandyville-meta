BEGIN;

ALTER TABLE fpl_unmatched_players
    ADD COLUMN IF NOT EXISTS fpl_team_id SMALLINT,
    ADD COLUMN IF NOT EXISTS fpl_team_name TEXT,
    ADD COLUMN IF NOT EXISTS element_type SMALLINT,
    ADD COLUMN IF NOT EXISTS birth_date DATE,
    ADD COLUMN IF NOT EXISTS team_join_date DATE,
    ADD COLUMN IF NOT EXISTS suggested_player_id INT,
    ADD COLUMN IF NOT EXISTS suggested_score NUMERIC(4,3),
    ADD COLUMN IF NOT EXISTS suggestion_reason TEXT,
    ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ NOT NULL DEFAULT now();

ALTER TABLE fpl_unmatched_players
    ADD CONSTRAINT fpl_unmatched_players_suggested_player_id
        FOREIGN KEY (suggested_player_id) REFERENCES players(id);

COMMIT;
