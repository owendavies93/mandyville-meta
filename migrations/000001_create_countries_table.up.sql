CREATE TABLE IF NOT EXISTS countries (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    code TEXT CHECK ( length(code) = 2 ),
    PRIMARY KEY (id)
)
