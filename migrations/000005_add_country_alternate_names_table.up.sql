BEGIN;

CREATE TABLE IF NOT EXISTS country_alternate_names (
    id INT GENERATED ALWAYS AS IDENTITY,
    country_id INT NOT NULL,
    alternate_name TEXT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT country_alternate_names_country_id
     FOREIGN KEY (country_id) REFERENCES countries (id)
);

CREATE INDEX idx_country_alternate_names_country_id ON country_alternate_names(country_id);

COMMIT;
