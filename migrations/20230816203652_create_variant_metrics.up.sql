CREATE TABLE IF NOT EXISTS client_metrics_env_variants
(
    feature_name TEXT,
    app_name     TEXT,
    environment  TEXT,
    bucket    TIMESTAMP WITH TIME ZONE,
    variant      TEXT,
    count        INTEGER DEFAULT 0,
    FOREIGN KEY (
                 feature_name, app_name, environment,
                 bucket
        ) REFERENCES client_metrics_env (
                                         feature_name, app_name, environment,
                                         bucket
        ) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (
                 feature_name, app_name, environment,
                 bucket, variant
        )
);