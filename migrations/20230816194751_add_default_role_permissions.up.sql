--- Adding permissions
INSERT INTO permissions(built_in, permission, display_name, permission_type)
VALUES (true, 'ADMIN', 'Admin', 'root'),
       (true, 'CREATE_FEATURE', 'Create feature toggles', 'project'),
       (true, 'CREATE_STRATEGY', 'Create activation strategies', 'root'),
       (true, 'CREATE_ADDON', 'Create Addons', 'root'),
       (true, 'READ_ADDON', 'Read Addons', 'root'),
       (true, 'UPDATE_ADDON', 'Update Addons', 'root'),
       (true, 'DELETE_ADDON', 'Delete Addons', 'root'),
       (true, 'READ_FEATURE', 'Read feature toggles', 'project'),
       (true, 'UPDATE_FEATURE', 'Update feature toggles', 'project'),
       (true, 'DELETE_FEATURE', 'Delete feature toggles', 'project'),
       (true, 'CREATE_TAG_TYPE', 'Create tag types', 'root'),
       (true, 'READ_TAG_TYPE', 'Read tag types', 'root'),
       (true, 'UPDATE_TAG_TYPE', 'Update tag types', 'root'),
       (true, 'DELETE_TAG_TYPE', 'Delete tag types', 'root'),
       (true, 'CREATE PROJECT', 'Create projects', 'root'),
       (true, 'UPDATE_PROJECT', 'Update projects', 'project'),
       (true, 'DELETE_PROJECT', 'Delete projects', 'project'),
       (true, 'READ_PROJECT', 'Read projects', 'project'),
       (true, 'READ_STRATEGY', 'Read strategies', 'root'),
       (true, 'UPDATE_STRATEGY', 'Update strategies', 'root'),
       (true, 'DELETE_STRATEGY', 'Delete strategies', 'root'),
       (true, 'CREATE_CONTEXT_FIELD', 'Create context fields', 'root'),
       (true, 'READ_CONTEXT_FIELD', 'Read context fields', 'root'),
       (true, 'UPDATE_CONTEXT_FIELD', 'Update context fields', 'root'),
       (true, 'DELETE_CONTEXT_FIELD', 'Delete context fields', 'root'),
       (true, 'CREATE_FEATURE_STRATEGY', 'Create activation strategies', 'environment'),
       (true, 'READ_FEATURE_STRATEGY', 'Read activation strategies', 'environment'),
       (true, 'UPDATE_FEATURE_STRATEGY', 'Update activation strategies', 'environment'),
       (true, 'DELETE_FEATURE_STRATEGY', 'Delete activation strategies', 'environment'),
       (true, 'CREATE_CLIENT_API_TOKEN', 'Create Client API token', 'root'),
       (true, 'READ_CLIENT_API_TOKEN', 'Read Client API token', 'root'),
       (true, 'UPDATE_CLIENT_API_TOKEN', 'Update Client API token', 'root'),
       (true, 'DELETE_CLIENT_API_TOKEN', 'Delete Client API token', 'root'),
       (true, 'CREATE_FRONTEND_API_TOKEN', 'Create Frontend API token', 'root'),
       (true, 'READ_FRONTEND_API_TOKEN', 'Read Frontend API token', 'root'),
       (true, 'UPDATE_FRONTEND_API_TOKEN', 'Update Frontend API token', 'root'),
       (true, 'DELETE_FRONTEND_API_TOKEN', 'Delete Frontend API token', 'root'),
       (true, 'UPDATE_FEATURE_VARIANTS', 'Create/edit variants', 'project'),
       (true, 'MOVE_FEATURE_TOGGLE', 'Change project of feature toggle', 'project'),
       (true, 'CREATE_SEGMENT', 'Create segments', 'root'),
       (true, 'READ_SEGMENT', 'Read segments', 'root'),
       (true, 'UPDATE_SEGMENT', 'Update/edit segments', 'root'),
       (true, 'DELETE_SEGMENT', 'Delete segments', 'root'),
       (true, 'CREATE_PROJECT_API_TOKEN', 'Create api tokens for a specific project', 'project'),
       (true, 'READ_PROJECT_API_TOKEN', 'Read api tokens for a specific project', 'project'),
       (true, 'DELETE_PROJECT_API_TOKEN', 'Delete api tokens for a specific project', 'project'),
       (true, 'UPDATE_FEATURE_ENVIRONMENT_VARIANTS', 'Update variants', 'environment'),
       (true, 'UPDATE_FEATURE_ENVIRONMENT', 'Enable/disable toggles for specific environment', 'environment'),
       (true, 'APPROVE_CHANGE_REQUEST', 'Approve change requests', 'environment'),
       (true, 'APPLY_CHANGE_REQUEST', 'Apply change requests', 'environment'),
       (true, 'SKIP_CHANGE_REQUEST', 'Skip change requests', 'environment'),
       (true, 'UPDATE_PROJECT_SEGMENT', 'Create/edit project segment', 'project');

--- Binding permissions to role
--- Admin
INSERT INTO role_permission(role_id, permission, environment) SELECT r.id, p.permission, '' FROM roles r, permissions p WHERE r.name = 'Admin' AND r.role_type = 'root' AND p.permission = 'ADMIN';
INSERT INTO role_permission(role_id, permission, environment) SELECT r.id, p.permission, '' FROM roles r, permissions p WHERE r.name = 'Editor' AND r.role_type = 'root' AND p.permission IN (
                                                                                                                                                                                         'CREATE_STRATEGY',
                                                                                                                                                                                         'CREATE_ADDON',
                                                                                                                                                                                         'READ_ADDON',
                                                                                                                                                                                         'DELETE_ADDON',
                                                                                                                                                                                         'UPDATE_ADDON',
                                                                                                                                                                                         'UPDATE_APPLICATION',
                                                                                                                                                                                         'UPDATE_TAG_TYPE',
                                                                                                                                                                                         'DELETE_TAG_TYPE',
                                                                                                                                                                                         'CREATE_PROJECT',
                                                                                                                                                                                         'READ_PROJECT'
                                                                                                                                                                                             'UPDATE_STRATEGY',
                                                                                                                                                                                         'READ_STRATEGY',
                                                                                                                                                                                         'DELETE_STRATEGY',
                                                                                                                                                                                         'CREATE_CONTEXT_FIELD',
                                                                                                                                                                                         'READ_CONTEXT_FIELD',
                                                                                                                                                                                         'UPDATE_CONTEXT_FIELD',
                                                                                                                                                                                         'DELETE_CONTEXT_FIELD',
                                                                                                                                                                                         'CREATE_SEGMENT',
                                                                                                                                                                                         'READ_SEGMENT',
                                                                                                                                                                                         'UPDATE_SEGMENT',
                                                                                                                                                                                         'DELETE_SEGMENT',
                                                                                                                                                                                         'READ_CLIENT_API_TOKEN',
                                                                                                                                                                                         'READ_FRONTEND_API_TOKEN'
    );
INSERT INTO role_permission(role_id, permission, environment) SELECT r.id, p.permission, '' FROM roles r, permissions p WHERE r.name = 'Owner' AND r.role_type = 'project' AND p.permission IN (
                                                                                                                                                                                           'CREATE_FEATURE',
                                                                                                                                                                                           'UPDATE_FEATURE',
                                                                                                                                                                                           'DELETE_FEATURE',
                                                                                                                                                                                           'UPDATE_PROJECT',
                                                                                                                                                                                           'DELETE_PROJECT',
                                                                                                                                                                                           'READ_PROJECT',
                                                                                                                                                                                           'UPDATE_FEATURE_VARIANTS',
                                                                                                                                                                                           'MOVE_FEATURE_TOGGLE',
                                                                                                                                                                                           'READ_PROJECT_API_TOKEN',
                                                                                                                                                                                           'CREATE_PROJECT_API_TOKEN',
                                                                                                                                                                                           'DELETE_PROJECT_API_TOKEN'
    );
INSERT INTO role_permission(role_id, permission, environment) SELECT r.id, p.permission, 'development' FROM roles r, permissions p WHERE r.name = 'Owner' AND r.role_type = 'project' AND p.permission IN ('CREATE_FEATURE_STRATEGY', 'READ_FEATURE_STRATEGY', 'UPDATE_FEATURE_STRATEGY', 'DELETE_FEATURE_STRATEGY', 'UPDATE_FEATURE_ENVIRONMENT', 'UPDATE_FEATURE_ENVIRONMENT_VARIANTS');
INSERT INTO role_permission(role_id, permission, environment) SELECT r.id, p.permission, 'production' FROM roles r, permissions p WHERE r.name = 'Owner' AND r.role_type = 'project' AND p.permission IN ('CREATE_FEATURE_STRATEGY', 'READ_FEATURE_STRATEGY', 'UPDATE_FEATURE_STRATEGY', 'DELETE_FEATURE_STRATEGY', 'UPDATE_FEATURE_ENVIRONMENT', 'UPDATE_FEATURE_ENVIRONMENT_VARIANTS');
INSERT INTO role_permission(role_id, permission, environment) SELECT r.id, p.permission, '' FROM roles r, permissions p WHERE r.name = 'Member' AND r.role_type = 'project' AND p.permission IN (
                                                                                                                                                                                            'CREATE_FEATURE',
                                                                                                                                                                                            'UPDATE_FEATURE',
                                                                                                                                                                                            'DELETE_FEATURE',
                                                                                                                                                                                            'READ_FEATURE',
                                                                                                                                                                                            'UPDATE_FEATURE_VARIANTS',
                                                                                                                                                                                            'READ_PROJECT_API_TOKEN',
                                                                                                                                                                                            'CREATE_PROJECT_API_TOKEN',
                                                                                                                                                                                            'DELETE_PROJECT_API_TOKEN'
    );
INSERT INTO role_permission(role_id, permission, environment) SELECT r.id, p.permission, 'development' FROM roles r, permissions p WHERE r.name = 'Member' AND r.role_type = 'project' AND p.permission IN ('CREATE_FEATURE_STRATEGY', 'READ_FEATURE_STRATEGY', 'UPDATE_FEATURE_STRATEGY', 'DELETE_FEATURE_STRATEGY', 'UPDATE_FEATURE_ENVIRONMENT', 'UPDATE_FEATURE_ENVIRONMENT_VARIANTS');
INSERT INTO role_permission(role_id, permission, environment) SELECT r.id, p.permission, 'production' FROM roles r, permissions p WHERE r.name = 'Member' AND r.role_type = 'project' AND p.permission IN ('CREATE_FEATURE_STRATEGY', 'READ_FEATURE_STRATEGY', 'UPDATE_FEATURE_STRATEGY', 'DELETE_FEATURE_STRATEGY', 'UPDATE_FEATURE_ENVIRONMENT', 'UPDATE_FEATURE_ENVIRONMENT_VARIANTS');
