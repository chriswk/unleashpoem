-- Add up migration script here
CREATE TABLE projects
(
    id          TEXT                     NOT NULL PRIMARY KEY,
    name        TEXT                     NOT NULL,
    description TEXT,
    health      INTEGER                  NOT NULL DEFAULT 100,
    created_at  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at  TIMESTAMP WITH TIME ZONE
)