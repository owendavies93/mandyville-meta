BEGIN;

ALTER TABLE fpl_gameweeks DROP CONSTRAINT IF EXISTS fpl_gameweeks_season_gameweek;

DROP TABLE IF EXISTS fpl_gameweeks;

COMMIT;
