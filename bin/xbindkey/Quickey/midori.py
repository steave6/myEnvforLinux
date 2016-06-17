import os

quickpy = os.path.abspath(os.path.dirname(__file__)) + "/quickey.py"
mousemove = os.path.abspath(os.path.dirname(__file__)) + "/mousemove.sh"

# Regexp of window title or WM_CLASS.
regexp = "midori4.Midori"
# Start up command.
command = "midori"
# Options
options = "-ca"

# Call the main routine(Don't change me!!).
os.system('python %s %s "%s" "%s"' % (quickpy, options, regexp, command)) 

import time
time.sleep(0.2)

os.system(mousemove)
