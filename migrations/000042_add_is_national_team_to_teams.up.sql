ALTER TABLE teams ADD COLUMN is_national_team BOOLEAN NOT NULL DEFAULT false;

UPDATE teams t
SET is_national_team = true
WHERE EXISTS (
    SELECT 1 FROM countries c WHERE c.name = t.name
) OR EXISTS (
    SELECT 1 FROM country_alternate_names can WHERE can.alternate_name = t.name
);
