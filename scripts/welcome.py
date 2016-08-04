#!/usr/bin/env python

import re
import subprocess

mins = '\d+ mins?'
days = '\d+ days?'
time = '\d{1,2}(( hrs)|(\:\d{1,2}))'
regex = '(%s, {1,2})?(%s|%s)(?=,)' % (days, time, mins)

raw_uptime = subprocess.check_output(['uptime'])

data = {
    'uptime': re.search(regex, raw_uptime).group(0).replace(',  ', ', '),
    'username': subprocess.check_output(['whoami'])[:-1].title()
}

message = """Welcome back, {username}.
Uptime: {uptime}"""

print message.format(**data)
