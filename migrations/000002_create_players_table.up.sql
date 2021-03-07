CREATE TABLE IF NOT EXISTS players (
   id BIGINT GENERATED ALWAYS AS IDENTITY,
   first_name TEXT NOT NULL,
   last_name  TEXT NOT NULL,
   country_id INT NOT NULL,
   PRIMARY KEY (id),
   CONSTRAINT players_country_id
    FOREIGN KEY (country_id) REFERENCES countries (id)
);
