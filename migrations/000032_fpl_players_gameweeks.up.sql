CREATE TABLE IF NOT EXISTS fpl_players_gameweeks (
    id INT GENERATED ALWAYS AS IDENTITY,
    player_id INT NOT NULL,
    fpl_gameweek_id INT NOT NULL,
    total_points SMALLINT NOT NULL,
    bonus_points SMALLINT NOT NULL,
    bps SMALLINT NOT NULL,
    value NUMERIC(3, 1) NOT NULL,
    selected INT NOT NULL,
    transfers_in INT NOT NULL,
    transfers_out INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fpl_players_gameweeks_player_id
        FOREIGN KEY (player_id) REFERENCES players(id),
    CONSTRAINT fpl_players_gameweeks_fpl_gameweek_id
        FOREIGN KEY (fpl_gameweek_id) REFERENCES fpl_gameweeks(id),
    CONSTRAINT fpl_players_gameweeks_player_id_fpl_gameweek_id
        UNIQUE (player_id, fpl_gameweek_id)
);
