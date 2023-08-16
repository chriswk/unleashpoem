CREATE TABLE api_tokens
(
    secret      TEXT                     NOT NULL PRIMARY KEY,
    username    TEXT                     NOT NULL,
    token_type  TEXT                     NOT NULL,
    environment TEXT REFERENCES environments (name) ON DELETE CASCADE,
    token_alias TEXT,
    created_at  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at  TIMESTAMP WITH TIME ZONE,
    expires_at  TIMESTAMP WITH TIME ZONE,
    seen_at     TIMESTAMP WITH TIME ZONE
);

CREATE TABLE api_token_project
(
    secret  TEXT NOT NULL REFERENCES api_tokens (secret) ON DELETE CASCADE,
    project TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    PRIMARY KEY (secret, project)
);
