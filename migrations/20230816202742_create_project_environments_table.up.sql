CREATE TABLE project_environments
(
    project_id       TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    environment_name TEXT NOT NULL REFERENCES environments (name) ON DELETE CASCADE,
    PRIMARY KEY (project_id, environment_name)
);

CREATE INDEX project_environments_environment_idx ON project_environments (environment_name);
