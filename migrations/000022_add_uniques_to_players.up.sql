BEGIN;

ALTER TABLE IF EXISTS players ADD CONSTRAINT players_football_data_id UNIQUE (football_data_id);

ALTER TABLE IF EXISTS players ADD CONSTRAINT players_understat_id UNIQUE (understat_id);;

COMMIT;
