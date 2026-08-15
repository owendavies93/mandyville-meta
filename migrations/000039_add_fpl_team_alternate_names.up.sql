INSERT INTO team_alternate_names (team_id, name)
SELECT id, 'Man City' FROM teams WHERE name = 'Manchester City FC'
ON CONFLICT (name) DO NOTHING;

INSERT INTO team_alternate_names (team_id, name)
SELECT id, 'Man Utd' FROM teams WHERE name = 'Manchester United FC'
ON CONFLICT (name) DO NOTHING;

INSERT INTO team_alternate_names (team_id, name)
SELECT id, 'Spurs' FROM teams WHERE name = 'Tottenham Hotspur FC'
ON CONFLICT (name) DO NOTHING;

INSERT INTO team_alternate_names (team_id, name)
SELECT id, 'Nott''m Forest' FROM teams WHERE name = 'Nottingham Forest FC'
ON CONFLICT (name) DO NOTHING;

INSERT INTO team_alternate_names (team_id, name)
SELECT id, 'Arsenal' FROM teams WHERE name = 'Arsenal FC'
ON CONFLICT (name) DO NOTHING;
