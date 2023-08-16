CREATE TABLE notifications
(
    id         TEXT                     NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    event_id   TEXT                     NOT NULL REFERENCES events (id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL             DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE
);

CREATE INDEX notifications_event_id_idx ON notifications (event_id);

CREATE TABLE user_notifications
(
    notification_id TEXT NOT NULL REFERENCES notifications (id) ON DELETE CASCADE,
    user_id         TEXT NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    read_at         TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (notification_id, user_id)
);