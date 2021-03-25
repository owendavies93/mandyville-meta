BEGIN;

CREATE TYPE position_category AS ENUM ('Goalkeeper', 'Defender', 'Midfielder', 'Forward');

CREATE TABLE IF NOT EXISTS positions (
    id SMALLINT GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL,
    position_category position_category NOT NULL,
    PRIMARY KEY (id)
);

COMMIT;
