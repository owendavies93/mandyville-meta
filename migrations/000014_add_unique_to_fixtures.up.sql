ALTER TABLE IF EXISTS fixtures ADD CONSTRAINT fixtures_team_competition_season UNIQUE (competition_id, home_team_id, away_team_id, season);
