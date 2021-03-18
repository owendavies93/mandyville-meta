BEGIN;

ALTER TABLE teams ADD COLUMN country_id INT
ALTER TABLE teams ADD CONSTRAINT teams_country_id
    FOREIGN KEY (country_id) REFERENCES countries (id);

COMMIT;
