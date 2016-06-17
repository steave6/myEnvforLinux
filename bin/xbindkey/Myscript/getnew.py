# Enter script code
import subprocess
from gi.repository import Notify

getdata = subprocess.check_output("getnew")

Notify.init("App Name")
notification = Notify.Notification.new(
  "getnewlist",
  getdata
  )

notification.show()
