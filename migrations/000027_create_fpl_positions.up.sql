CREATE TABLE IF NOT EXISTS fpl_positions (
    id INT GENERATED ALWAYS AS IDENTITY,
    element_type_id SMALLINT NOT NULL UNIQUE,
    element_type position_category NOT NULL UNIQUE,
    PRIMARY KEY (id)
);
