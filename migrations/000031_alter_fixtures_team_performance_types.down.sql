ALTER TABLE IF EXISTS fixtures_team_performance
    ALTER COLUMN ppda TYPE NUMERIC(6, 4),
    ALTER COLUMN win_chance TYPE NUMERIC(6, 4),
    ALTER COLUMN draw_chance TYPE NUMERIC(6, 4),
    ALTER COLUMN loss_chance TYPE NUMERIC(6, 4),
    ALTER COLUMN xpts TYPE NUMERIC(6, 4);
