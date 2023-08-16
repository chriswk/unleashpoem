CREATE TABLE feature_types
(
    id            TEXT                     NOT NULL PRIMARY KEY,
    name          TEXT                     NOT NULL,
    description   TEXT,
    lifetime_days INTEGER,
    built_in      BOOLEAN                  NOT NULL DEFAULT false,
    created_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at    TIMESTAMP WITH TIME ZONE
);