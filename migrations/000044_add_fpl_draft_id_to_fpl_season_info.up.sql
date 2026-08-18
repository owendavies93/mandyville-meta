ALTER TABLE fpl_season_info ADD COLUMN fpl_draft_id SMALLINT;

CREATE INDEX idx_fpl_season_info_season_fpl_draft_id
    ON fpl_season_info (season, fpl_draft_id);
