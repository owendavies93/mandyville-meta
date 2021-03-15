BEGIN;

DROP INDEX IF EXISTS idx_country_alternate_names_country_id;

DROP TABLE IF EXISTS country_alternate_names;

COMMIT;
