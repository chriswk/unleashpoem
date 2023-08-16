CREATE TABLE login_events
(
    id             TEXT                     NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    username       TEXT                     NOT NULL,
    auth_type      TEXT                     NOT NULL,
    successful     BOOLEAN                  NOT NULL,
    ip             INET,
    failure_reason TEXT,
    created_at     TIMESTAMP WITH TIME ZONE NOT NULL             DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at     TIMESTAMP WITH TIME ZONE
);

CREATE INDEX login_events_ip_idx ON login_events (ip);
