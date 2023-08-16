CREATE TABLE client_metrics_env
(
    feature_name TEXT                     NOT NULL,
    app_name     TEXT                     NOT NULL,
    environment  TEXT                     NOT NULL,
    bucket       TIMESTAMP WITH TIME ZONE NOT NULL,
    yes          BIGINT default 0,
    no           BIGINT default 0,
    PRIMARY KEY (feature_name, app_name, environment, bucket)
);
CREATE INDEX client_metrics_feature_name_idx ON client_metrics_env (feature_name);

CREATE TABLE client_instances
(
    app_name    TEXT                     NOT NULL,
    instance_id TEXT                     NOT NULL,
    client_ip   INET,
    last_seen   TIMESTAMP WITH TIME ZONE          DEFAULT now(),
    sdk_version TEXT,
    environment TEXT,
    created_at  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at  TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (app_name, environment, instance_id)
);

CREATE INDEX client_instances_environment_idx ON client_instances (environment);

CREATE TABLE client_applications
(
    app_name    TEXT                     NOT NULL PRIMARY KEY,
    strategies  JSONB,
    description TEXT,
    icon        TEXT,
    url         TEXT,
    color       TEXT,
    announced   BOOLEAN                  NOT NULL DEFAULT false,
    created_by  TEXT,
    created_at  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at  TIMESTAMP WITH TIME ZONE
);

