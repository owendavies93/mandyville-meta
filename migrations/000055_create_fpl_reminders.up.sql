BEGIN;

CREATE TABLE IF NOT EXISTS fpl_reminders (
    id INT GENERATED ALWAYS AS IDENTITY,
    season SMALLINT NOT NULL,
    gameweek SMALLINT NOT NULL,
    kind TEXT NOT NULL,
    offset_minutes INT NOT NULL,
    deadline TIMESTAMPTZ NOT NULL,
    status TEXT NOT NULL,
    channel TEXT,
    message TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (id),
    CONSTRAINT fpl_reminders_unique
        UNIQUE (season, gameweek, kind, offset_minutes, deadline)
);

COMMIT;
