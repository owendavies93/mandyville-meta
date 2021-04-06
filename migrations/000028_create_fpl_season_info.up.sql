CREATE TABLE IF NOT EXISTS fpl_season_info (
    id INT GENERATED ALWAYS AS IDENTITY,
    player_id INT NOT NULL,
    season SMALLINT NOT NULL,
    fpl_season_id SMALLINT NOT NULL,
    fpl_positions_id SMALLINT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fpl_season_info_player_id
        FOREIGN KEY (player_id) REFERENCES players(id),
    CONSTRAINT fpl_season_info_fpl_positions_id
        FOREIGN KEY (fpl_positions_id) REFERENCES fpl_positions(id),
    CONSTRAINT fpl_season_info_player_id_season
        UNIQUE (player_id, season)
);
