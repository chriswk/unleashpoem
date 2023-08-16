CREATE TABLE sessions
(
    key           TEXT PRIMARY KEY         NOT NULL,
    session_state JSONB,
    expires       TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at    TIMESTAMP WITH TIME ZONE
);