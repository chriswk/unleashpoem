CREATE TABLE feature_tag
(
    feature_name TEXT                     NOT NULL REFERENCES features (name) ON DELETE CASCADE,
    tag_type     TEXT                     NOT NULL,
    tag_value    TEXT                     NOT NULL,
    created_at   TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at   TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (feature_name, tag_type, tag_value),
    FOREIGN KEY (tag_type, tag_value) REFERENCES tags (tag_type, tag_value) ON DELETE CASCADE
);
CREATE INDEX feature_tag_tag_type_and_value_idx ON feature_tag (tag_type, tag_value);
