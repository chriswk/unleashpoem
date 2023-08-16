CREATE TABLE addons
(
    id           TEXT                     NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    provider     TEXT                     NOT NULL,
    description  TEXT,
    enabled      BOOLEAN                  NOT NULL             DEFAULT true,
    parameters   JSONB,
    events       JSONB                    NOT NULL             DEFAULT '[]'::jsonb,
    projects     JSONB                                         DEFAULT '[]'::jsonb,
    environments JSONB                                         DEFAULT '[]'::jsonb,
    created_at   TIMESTAMP WITH TIME ZONE NOT NULL             DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at   TIMESTAMP WITH TIME ZONE
);