ALTER TABLE fpl_season_info ADD COLUMN team_id INT REFERENCES teams(id);
