CREATE VIEW user_permissions AS
(
SELECT u.id, p.permission
FROM users u
         JOIN role_user ru ON u.id = ru.user_id
         JOIN role_permission rp ON rp.role_id = ru.role_id
         JOIN permissions p ON rp.permission = p.permission
UNION
SELECT u.id, p.permission
FROM users u
         JOIN group_user gu ON u.id = gu.user_id
         JOIN group_role gr ON gu.group_id = gr.group_id
         JOIN role_permission r on gr.role_id = r.role_id
         JOIN permissions p on r.permission = p.permission);
