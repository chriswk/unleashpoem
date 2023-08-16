CREATE TABLE favorite_features
(
    feature    TEXT                     NOT NULL REFERENCES features (name) ON DELETE CASCADE,
    user_id    TEXT                     NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (feature, user_id)
);

CREATE INDEX favorite_features_user_id_idx ON favorite_features (user_id);

CREATE TABLE favorite_projects
(
    project    TEXT                     NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    user_id    TEXT                     NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (project, user_id)
);

CREATE INDEX favorite_projects_user_id_idx ON favorite_projects (user_id);
