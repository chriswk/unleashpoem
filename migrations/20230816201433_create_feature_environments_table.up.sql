CREATE TABLE feature_environments
(
    environment  TEXT    NOT NULL REFERENCES environments (name) ON DELETE CASCADE,
    feature_name TEXT    NOT NULL REFERENCES features (name) ON DELETE CASCADE,
    enabled      BOOLEAN NOT NULL DEFAULT false,
    variants     JSONB   NOT NULL DEFAULT '[]'::jsonb,
    PRIMARY KEY (environment, feature_name)
);
CREATE INDEX feature_environments_feature_name_idx ON feature_environments (feature_name);
