#!/usr/bin/env python

from os import path
import sys
import json

targetfile = path.expanduser('~/.config/karabiner/karabiner.json')

with open(targetfile) as settings_file:
  settings = json.load(settings_file)

profile_name = sys.argv[1]
for profile in settings['profiles']:
  profile['selected'] = False
  if profile['name'] == profile_name:
    profile['selected'] = True

with open(targetfile, 'w') as settings_file:
  json.dump(settings, settings_file, indent=4, separators=(',', ': '))

print 'switched karabiner-element profile to {}'.format(profile_name)
