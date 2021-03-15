BEGIN;

DROP INDEX IF EXISTS idx_teams_competitions_competition_id_season;

DROP INDEX IF EXISTS idx_teams_competitions_team_id;

DROP TABLE IF EXISTS teams_competitions;

COMMIT;
