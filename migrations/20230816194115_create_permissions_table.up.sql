CREATE TABLE permissions(
    permission TEXT NOT NULL PRIMARY KEY,
    permission_type TEXT,
    display_name TEXT,
    built_in BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE
);