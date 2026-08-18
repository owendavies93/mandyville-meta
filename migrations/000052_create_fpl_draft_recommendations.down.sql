BEGIN;

DROP INDEX IF EXISTS idx_fpl_draft_recommendations_run_id;

DROP INDEX IF EXISTS idx_fpl_draft_recommendation_runs_league_id_run_time;

DROP TABLE IF EXISTS fpl_draft_recommendations;

DROP TABLE IF EXISTS fpl_draft_recommendation_runs;

COMMIT;
