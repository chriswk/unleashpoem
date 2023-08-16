INSERT INTO public.feature_types (id, name, description, lifetime_days, built_in)
VALUES ('release', 'Release', 'Release feature toggles are used to release new features.', 40, true);
INSERT INTO public.feature_types (id, name, description, lifetime_days, built_in)
VALUES ('experiment', 'Experiment',
        'Experiment feature toggles are used to test and verify multiple different versions of a feature.', 40, true);
INSERT INTO public.feature_types (id, name, description, lifetime_days, built_in)
VALUES ('operational', 'Operational', 'Operational feature toggles are used to control aspects of a rollout.', 7, true);
INSERT INTO public.feature_types (id, name, description, lifetime_days, built_in)
VALUES ('kill-switch', 'Kill switch',
        'Kill switch feature toggles are used to quickly turn on or off critical functionality in your system.', null,
        true);
INSERT INTO public.feature_types (id, name, description, lifetime_days, built_in)
VALUES ('permission', 'Permission', 'Permission feature toggles are used to control permissions in your system.', null,
        true);
