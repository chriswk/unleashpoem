CREATE TABLE strategies
(
    name         TEXT                     NOT NULL PRIMARY KEY,
    description  TEXT,
    parameters   JSONB,
    built_in     BOOLEAN                  NOT NULL DEFAULT false,
    deprecated   BOOLEAN                  NOT NULL DEFAULT false,
    sort_order   INTEGER                  NOT NULL DEFAULT 9999,
    display_name TEXT,
    title        TEXT,
    created_at   TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at   TIMESTAMP WITH TIME ZONE
);