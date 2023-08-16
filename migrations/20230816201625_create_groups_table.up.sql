CREATE TABLE groups
(
    id           TEXT                     NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    name         TEXT                     NOT NULL,
    description  TEXT,
    created_by   TEXT,
    created_at   TIMESTAMP WITH TIME ZONE NOT NULL             DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at   TIMESTAMP WITH TIME ZONE,
    mappings_sso JSONB                                         default '[]'::jsonb
);

CREATE TABLE group_role
(
    group_id   TEXT                     NOT NULL REFERENCES groups (id) ON DELETE CASCADE,
    role_id    TEXT                     NOT NULL REFERENCES roles (id) ON DELETE CASCADE,
    created_by TEXT,
    project    TEXT                     NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (group_id, role_id, project)
);

CREATE INDEX group_role_role_id_idx ON group_role (role_id);
CREATE INDEX group_role_group_id_idx ON group_Role (group_id);

CREATE TABLE group_user
(
    group_id   TEXT                     NOT NULL REFERENCES groups (id) ON DELETE CASCADE,
    user_id    TEXT                     NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    created_by TEXT,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (group_id, user_id)
);

CREATE INDEX group_user_group_id_idx ON group_user (group_id);
CREATE INDEX group_user_user_id_idx ON group_user (user_id);
