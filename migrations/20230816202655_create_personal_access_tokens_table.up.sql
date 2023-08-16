CREATE TABLE personal_access_tokens
(
    id          TEXT                     NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    secret      TEXT                     NOT NULL UNIQUE,
    description TEXT,
    user_id     TEXT                     NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    expires_at  TIMESTAMP WITH TIME ZONE NOT NULL,
    seen_at     TIMESTAMP WITH TIME ZONE,
    created_at  TIMESTAMP WITH TIME ZONE NOT NULL             DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at  TIMESTAMP WITH TIME ZONE
)
