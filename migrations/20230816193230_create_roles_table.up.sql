CREATE TABLE roles(
    id TEXT NOT NULL PRIMARY KEY DEFAULT generate_ulid(),
    name TEXT UNIQUE NOT NULL,
    description TEXT,
    role_type TEXT DEFAULT 'custom'::text,
    from_migration BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITH TIME ZONE
);