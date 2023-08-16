CREATE TABLE environments
(
    name             TEXT                     NOT NULL PRIMARY KEY,
    environment_type TEXT                     NOT NULL,
    enabled          BOOLEAN                  NOT NULL DEFAULT true,
    protected        BOOLEAN                  NOT NULL DEFAULT false,
    sort_order       INTEGER                  NOT NULL DEFAULT 9999,
    created_at       TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at       TIMESTAMP WITH TIME ZONE
);
