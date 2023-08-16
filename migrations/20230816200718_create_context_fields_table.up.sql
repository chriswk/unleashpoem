CREATE TABLE context_fields
(
    name         TEXT                     NOT NULL PRIMARY KEY,
    description  TEXT,
    sort_order   INTEGER                  NOT NULL DEFAULT 10,
    legal_values JSONB,
    stickiness   BOOLEAN                  NOT NULL DEFAULT false,
    created_at   TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at   TIMESTAMP WITH TIME ZONE
);