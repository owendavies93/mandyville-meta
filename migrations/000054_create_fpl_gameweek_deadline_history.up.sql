BEGIN;

CREATE TABLE IF NOT EXISTS fpl_gameweek_deadline_history (
    id INT GENERATED ALWAYS AS IDENTITY,
    fpl_gameweek_id INT NOT NULL,
    kind TEXT NOT NULL,
    deadline TIMESTAMPTZ NOT NULL,
    start_time TIMESTAMPTZ NOT NULL DEFAULT now(),
    end_time TIMESTAMPTZ,
    PRIMARY KEY (id),
    CONSTRAINT fpl_gameweek_deadline_history_gameweek_id
        FOREIGN KEY (fpl_gameweek_id) REFERENCES fpl_gameweeks(id)
);

CREATE UNIQUE INDEX fpl_gameweek_deadline_history_open
    ON fpl_gameweek_deadline_history (fpl_gameweek_id, kind)
    WHERE end_time IS NULL;

COMMIT;
