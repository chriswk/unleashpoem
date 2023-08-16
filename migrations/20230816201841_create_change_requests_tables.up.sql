CREATE TABLE change_requests
(
    id            TEXT                     NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    environment   TEXT                     NOT NULL REFERENCES environments (name) ON DELETE CASCADE,
    state         TEXT                     NOT NULL,
    project       TEXT                     NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    min_approvals INTEGER                  NOT NULL             DEFAULT 1,
    created_at    TIMESTAMP WITH TIME ZONE NOT NULL             DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at    TIMESTAMP WITH TIME ZONE
);

CREATE INDEX change_requests_environment_idx ON change_requests (environment);
CREATE INDEX change_requests_project_idx ON change_requests (project);

CREATE TABLE change_request_settings
(
    project            TEXT    NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    environment        TEXT    NOT NULL REFERENCES environments (name) ON DELETE CASCADE,
    required_approvals INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY (project, environment)
);

CREATE TABLE change_request_events
(
    id                TEXT                     NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    feature           TEXT                     NOT NULL REFERENCES features (name) ON DELETE CASCADE,
    action            TEXT                     NOT NULL,
    payload           JSONB                    NOT NULL             DEFAULT '[]'::jsonb,
    created_by        TEXT                     NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    change_request_id TEXT                     NOT NULL REFERENCES change_requests (id) ON DELETE CASCADE,
    created_at        TIMESTAMP WITH TIME ZONE NOT NULL             DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at        TIMESTAMP WITH TIME ZONE
);

CREATE INDEX change_request_events_change_request_id_idx ON change_request_events (change_request_id);
CREATE INDEX change_request_events_created_by_idx ON change_request_events (created_by);

CREATE TABLE change_request_comments
(
    id                TEXT                     NOT NULL PRIMARY KEY,
    change_request_id TEXT                     NOT NULL REFERENCES change_requests (id) ON DELETE CASCADE,
    comment           TEXT                     NOT NULL,
    created_by        TEXT                     NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    created_at        TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at        TIMESTAMP WITH TIME ZONE
);

CREATE INDEX change_request_comments_change_request_id_idx ON change_request_comments (change_request_id);
CREATE INDEX change_request_comments_created_by_idx ON change_request_comments (created_by);

CREATE TABLE change_request_approvals
(
    id                TEXT                     NOT NULL PRIMARY KEY,
    change_request_id TEXT                     NOT NULL REFERENCES change_requests (id) ON DELETE CASCADE,
    created_by        TEXT                     NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    created_at        TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at        TIMESTAMP WITH TIME ZONE,
    CONSTRAINT unique_approvals UNIQUE (change_request_id, created_by)
);

CREATE INDEX change_request_approvals_change_request_id_idx ON change_request_approvals (change_request_id);
CREATE INDEX change_request_approvals_created_by_idx ON change_request_approvals (created_by);
