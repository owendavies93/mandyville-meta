ALTER TABLE IF EXISTS teams_competitions ADD CONSTRAINT teams_competitions_team_competition_season UNIQUE (team_id, competition_id, season);
