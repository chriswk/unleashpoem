CREATE TABLE events
(
    id           TEXT                     NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    event_type   TEXT                     NOT NULL,
    created_by   TEXT                     NOT NULL,
    event_data   JSONB,
    tags         JSONB                                         DEFAULT '[]'::jsonb,
    project      TEXT REFERENCES projects (id) ON DELETE CASCADE,
    environment  TEXT,
    feature_name TEXT,
    pre_data     JSONB,
    created_at   TIMESTAMP WITH TIME ZONE NOT NULL             DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at   TIMESTAMP WITH TIME ZONE
);