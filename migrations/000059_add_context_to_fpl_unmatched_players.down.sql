BEGIN;

ALTER TABLE fpl_unmatched_players
    DROP CONSTRAINT IF EXISTS fpl_unmatched_players_suggested_player_id;

ALTER TABLE fpl_unmatched_players
    DROP COLUMN IF EXISTS fpl_team_id,
    DROP COLUMN IF EXISTS fpl_team_name,
    DROP COLUMN IF EXISTS element_type,
    DROP COLUMN IF EXISTS birth_date,
    DROP COLUMN IF EXISTS team_join_date,
    DROP COLUMN IF EXISTS suggested_player_id,
    DROP COLUMN IF EXISTS suggested_score,
    DROP COLUMN IF EXISTS suggestion_reason,
    DROP COLUMN IF EXISTS updated_at;

COMMIT;
