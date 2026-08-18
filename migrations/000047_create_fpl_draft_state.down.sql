BEGIN;

DROP TABLE IF EXISTS fpl_draft_entry_picks;

DROP INDEX IF EXISTS fpl_draft_ownership_league_id_element_open;

DROP TABLE IF EXISTS fpl_draft_ownership;

DROP TABLE IF EXISTS fpl_draft_transactions;

DROP TABLE IF EXISTS fpl_draft_picks;

COMMIT;
