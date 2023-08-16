INSERT INTO roles(name, description, role_type, from_migration)
VALUES ('Admin',
        'Users with the root admin role have superuser access to Unleash and can perform any operation within the Unleash platform.',
        'root', true),
       ('Editor',
        'Users with the root editor role have access to most features in Unleash, but can not manage users and roles in the root scope. Editors will be added as project owners when creating projects and get superuser rights within the context of these projects. Users with the editor role will also get access to most permissions on the default project by default.',
        'root', true),
       ('Viewer',
        'Users with the root viewer role can only read root resources in Unleash. Viewers can be added to specific projects as project members. Users with the viewer role may not view API tokens.',
        'root', true),
       ('Owner',
        'Users with the project owner role have full control over the project, and can add and manage other users within the project context, manage feature toggles within the project, and control advanced project features like archiving and deleting the project.',
        'project', true),
       ('Member',
        'Users with the project member role are allowed to view, create, and update feature toggles within a project, but have limited permissions in regards to managing the project''s user access and can not archive or delete the project.',
        'project', true)