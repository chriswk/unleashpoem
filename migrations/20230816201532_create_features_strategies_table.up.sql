CREATE TABLE feature_strategies
(
    id            TEXT                     NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    feature_name  TEXT                     NOT NULL REFERENCES features (name) ON DELETE CASCADE,
    project_name  TEXT                     NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    environment   TEXT                     NOT NULL REFERENCES environments (name) ON DELETE CASCADE,
    strategy_name TEXT                     NOT NULL REFERENCES strategies (name) ON DELETE CASCADE,
    parameters    JSONB                    NOT NULL             DEFAULT '{}'::jsonb,
    constraints   JSONB,
    sort_order    INTEGER                  NOT NULL             DEFAULT 9999,
    created_at    TIMESTAMP WITH TIME ZONE NOT NULL             DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at    TIMESTAMP WITH TIME ZONE
);

CREATE INDEX feature_strategies_environment_idx ON feature_strategies (environment);
CREATE INDEX feature_strategies_feature_name_idx ON feature_strategies (feature_name);
