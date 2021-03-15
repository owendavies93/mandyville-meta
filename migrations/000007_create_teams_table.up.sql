CREATE TABLE IF NOT EXISTS teams (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL,
    country_id INT NOT NULL,
    football_data_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT teams_country_id
     FOREIGN KEY (country_id) REFERENCES countries (id)
);
