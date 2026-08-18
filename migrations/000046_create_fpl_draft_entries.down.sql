BEGIN;

DROP INDEX IF EXISTS fpl_draft_waiver_order_draft_entry_id_open;

DROP TABLE IF EXISTS fpl_draft_waiver_order;

DROP TABLE IF EXISTS fpl_draft_entries;

COMMIT;
