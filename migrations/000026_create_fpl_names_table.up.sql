CREATE TABLE IF NOT EXISTS fpl_names (
    id INT GENERATED ALWAYS AS IDENTITY,
    player_id INT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fpl_names_player_id
        FOREIGN KEY (player_id) REFERENCES players(id)
);
