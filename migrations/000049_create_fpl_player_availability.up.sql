CREATE TABLE IF NOT EXISTS fpl_player_availability (
    id INT GENERATED ALWAYS AS IDENTITY,
    player_id INT,
    fpl_draft_element SMALLINT NOT NULL,
    season SMALLINT NOT NULL,
    status CHAR(1),
    chance_of_playing_this SMALLINT,
    chance_of_playing_next SMALLINT,
    news TEXT,
    news_added TIMESTAMPTZ,
    news_return DATE,
    draft_rank SMALLINT,
    start_time TIMESTAMPTZ NOT NULL DEFAULT now(),
    end_time TIMESTAMPTZ,
    PRIMARY KEY (id),
    CONSTRAINT fpl_player_availability_player_id
        FOREIGN KEY (player_id) REFERENCES players(id)
);

CREATE UNIQUE INDEX fpl_player_availability_season_element_open
    ON fpl_player_availability (season, fpl_draft_element)
    WHERE end_time IS NULL;
