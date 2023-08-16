CREATE TABLE user_splash
(
    user_id    TEXT                     NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    splash_id  TEXT                     NOT NULL,
    seen       BOOLEAN                  NOT NULL DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (user_id, splash_id)
);
CREATE INDEX user_splash_user_id_idx ON user_splash (user_id);