INSERT INTO public.strategies (name, description, parameters, built_in, deprecated, sort_order, display_name, title)
VALUES ('remoteAddress', 'Enable the feature for a specific set of IP addresses.', '[
  {
    "name": "IPs",
    "type": "list",
    "description": "List of IPs to enable the feature toggle for.",
    "required": true
  }
]', true, false, 3, 'IPs', null);
INSERT INTO public.strategies (name, description, parameters, built_in, deprecated, sort_order, display_name, title)
VALUES ('applicationHostname', 'Enable the feature for a specific set of hostnames.', '[
  {
    "name": "hostNames",
    "type": "list",
    "description": "List of hostnames to enable the feature toggle for.",
    "required": false
  }
]', true, false, 4, 'Hosts', null);
INSERT INTO public.strategies (name, description, parameters, built_in, deprecated, sort_order, display_name, title)
VALUES ('default',
        'This strategy turns on / off for your entire userbase. Prefer using "Gradual rollout" strategy (100%=on, 0%=off).',
        '[]', true, false, 1, 'Standard', null);
INSERT INTO public.strategies (name, description, parameters, built_in, deprecated, sort_order, display_name, title)
VALUES ('flexibleRollout',
        'Roll out to a percentage of your userbase, and ensure that the experience is the same for the user on each visit.',
        '[
          {
            "name": "rollout",
            "type": "percentage",
            "description": "",
            "required": false
          },
          {
            "name": "stickiness",
            "type": "string",
            "description": "Used define stickiness. Possible values: default, userId, sessionId, random",
            "required": true
          },
          {
            "name": "groupId",
            "type": "string",
            "description": "Used to define a activation groups, which allows you to correlate across feature toggles.",
            "required": true
          }
        ]', true, false, 0, 'Gradual rollout', null);
