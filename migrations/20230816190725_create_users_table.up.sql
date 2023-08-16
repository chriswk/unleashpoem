CREATE TABLE users
(
    id             TEXT                     NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    name           TEXT,
    username       TEXT                     NOT NULL UNIQUE,
    email          TEXT                     NOT NULL UNIQUE,
    image_url      TEXT,
    password_hash  TEXT,
    login_attempts INTEGER                  NOT NULL             DEFAULT 0,
    settings       JSONB,
    is_service     BOOLEAN                  NOT NULL             DEFAULT false,
    created_at     TIMESTAMP WITH TIME ZONE NOT NULL             DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at     TIMESTAMP WITH TIME ZONE,
    deleted_at     TIMESTAMP WITH TIME ZONE,
    last_seen_at   TIMESTAMP WITH TIME ZONE
)