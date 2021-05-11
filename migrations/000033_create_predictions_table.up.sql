CREATE TABLE IF NOT EXISTS predictions (
    id INT GENERATED ALWAYS AS IDENTITY,
    player_id INT NOT NULL,
    fpl_gameweek_id INT NOT NULL,
    predictor_id INT NOT NULL,
    prediction NUMERIC(6, 4) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT predictions_player_id
        FOREIGN KEY (player_id) REFERENCES players(id),
    CONSTRAINT predictions_fpl_gameweek_id
        FOREIGN KEY (fpl_gameweek_id) REFERENCES fpl_gameweeks(id),
    CONSTRAINT predictions_player_id_fpl_gameweek_id_predictor_id
        UNIQUE (player_id, fpl_gameweek_id, predictor_id)
);
