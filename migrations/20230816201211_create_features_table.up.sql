CREATE TABLE features
(
    name            TEXT                     NOT NULL PRIMARY KEY,
    description     TEXT,
    variants        JSONB                             default '[]'::jsonb,
    feature_type    TEXT REFERENCES feature_types (id) ON DELETE CASCADE,
    project         TEXT REFERENCES projects (id) ON DELETE CASCADE,
    stale           BOOLEAN                  NOT NULL DEFAULT false,
    impression_data BOOLEAN                  NOT NULL DEFAULT false,
    created_at      TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at      TIMESTAMP WITH TIME ZONE,
    last_seen_at    TIMESTAMP WITH TIME ZONE,
    archived_at     TIMESTAMP WITH TIME ZONE
)
