CREATE TABLE reset_tokens
(
    reset_token TEXT                     NOT NULL PRIMARY KEY,
    user_id     TEXT                     NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    expires_at  TIMESTAMP WITH TIME ZONE NOT NULL,
    used_at     TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at  TIMESTAMP WITH TIME ZONE
)