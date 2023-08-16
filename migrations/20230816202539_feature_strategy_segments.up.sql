CREATE TABLE feature_strategy_segment
(
    feature_strategy_id TEXT                     NOT NULL REFERENCES feature_strategies (id) ON UPDATE CASCADE ON DELETE CASCADE,
    segment_id          TEXT                     NOT NULL REFERENCES segments (id) ON DELETE CASCADE,
    created_at          TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at          TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (feature_strategy_id, segment_id)
);

CREATE INDEX feature_strategy_segment_segment_id_idx ON feature_strategy_segment (segment_id);
