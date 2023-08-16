CREATE TABLE role_permission
(
    role_id     TEXT                     NOT NULL REFERENCES roles (id) ON DELETE CASCADE,
    permission  TEXT                     NOT NULL REFERENCES permissions (permission) ON DELETE CASCADE,
    environment TEXT,
    built_in    BOOLEAN                  NOT NULL DEFAULT false,
    created_at  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at  TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (role_id, permission, environment)
);
CREATE INDEX role_permission_permission_idx ON role_permission (permission);
CREATE INDEX role_permission_role_id_idx ON role_permission (role_id);