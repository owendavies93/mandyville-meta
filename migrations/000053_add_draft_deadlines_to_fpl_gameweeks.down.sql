BEGIN;

ALTER TABLE fpl_gameweeks
    DROP COLUMN IF EXISTS draft_deadline,
    DROP COLUMN IF EXISTS waivers_time,
    DROP COLUMN IF EXISTS trades_time;

COMMIT;
