CREATE TABLE role_user(
    role_id TEXT NOT NULL REFERENCES roles(id) ON DELETE CASCADE,
    user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (role_id, user_id)
);
CREATE INDEX role_user_user_id_idx ON role_user(user_id);
CREATE INDEX role_user_role_id_idx ON role_user(role_id);