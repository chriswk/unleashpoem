CREATE TABLE tags
(
    tag_type   TEXT                     NOT NULL REFERENCES tag_types (name) ON DELETE CASCADE,
    tag_value  TEXT                     NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (tag_type, tag_value)
);