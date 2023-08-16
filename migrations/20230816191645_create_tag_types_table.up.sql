CREATE TABLE tag_types
(
    name        TEXT                     NOT NULL PRIMARY KEY,
    description TEXT,
    icon        TEXT,
    created_at  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at  TIMESTAMP WITH TIME ZONE
);

INSERT INTO tag_types(name, description, icon) VALUES ('simple', 'Used to simplify filtering of features', '#');
INSERT INTO tag_types(name, description, icon) VALUES ('slack', 'Used to tag features for addon updates for slack', 'S');