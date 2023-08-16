CREATE TABLE public_signup_tokens
(
    secret     TEXT                     NOT NULL PRIMARY KEY,
    name       TEXT,
    created_by TEXT                     NOT NULL,
    role_id    TEXT REFERENCES roles (id) ON DELETE CASCADE,
    url        TEXT,
    enabled    BOOLEAN                  NOT NULL DEFAULT true,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE public_signup_tokens_user
(
    secret     TEXT                     NOT NULL REFERENCES public_signup_tokens (secret),
    user_id    TEXT                     NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (secret, user_id)
);
