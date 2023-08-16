CREATE TABLE project_stats
(
    project                              TEXT NOT NULL PRIMARY KEY REFERENCES projects (id) ON DELETE CASCADE,
    avg_time_to_prod_current_window      double precision default 0,
    avg_time_to_prod_past_window         double precision default 0,
    project_changes_current_window       integer          default 0,
    project_changes_past_window          integer          default 0,
    features_created_current_window      integer          default 0,
    features_created_past_window         integer          default 0,
    features_archived_current_window     integer          default 0,
    features_archived_past_window        integer          default 0,
    project_members_added_current_window integer          default 0
)
