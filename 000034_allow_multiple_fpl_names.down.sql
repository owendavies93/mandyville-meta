ALTER TABLE fpl_names DROP CONSTRAINT fpl_names_player_id_name_key;
ALTER TABLE fpl_names ADD CONSTRAINT fpl_names_player_id_key UNIQUE (player_id);
