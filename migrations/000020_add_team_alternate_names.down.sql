BEGIN;

DROP INDEX IF EXISTS idx_team_alternate_names_team_id;

DROP TABLE IF EXISTS team_alternate_names;

COMMIT;
