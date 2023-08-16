CREATE TABLE segments
(
    id                 TEXT                     NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    name               TEXT                     NOT NULL,
    created_by         TEXT                     NOT NULL,
    description        TEXT,
    constraints        JSONB                    NOT NULL             DEFAULT '[]'::jsonb,
    segment_project_id TEXT REFERENCES projects (id) ON DELETE CASCADE,
    created_at         TIMESTAMP WITH TIME ZONE NOT NULL             DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at         TIMESTAMP WITH TIME ZONE
);
CREATE INDEX segment_name_idx ON segments(name);
CREATE INDEX segment_project_id_idx ON segments(segment_project_id);