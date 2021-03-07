CREATE TABLE IF NOT EXISTS competitions (
   id INT GENERATED ALWAYS AS IDENTITY,
   name TEXT NOT NULL,
   country_id INT NOT NULL,
   PRIMARY KEY (id),
   CONSTRAINT competitions_country_id
    FOREIGN KEY (country_id) REFERENCES countries (id)
)
