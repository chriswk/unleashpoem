CREATE TABLE user_feedback
(
    user_id     TEXT                     NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    feedback_id TEXT                     NOT NULL DEFAULT generate_ulid(),
    given       TIMESTAMP WITH TIME ZONE,
    nevershow   BOOLEAN                  NOT NULL DEFAULT false,
    created_at  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at  TIMESTAMP WITH TIME ZONE,
    primary key (user_id, feedback_id)
);

CREATE INDEX user_feedback_user_id_idx ON user_feedback (user_id);