#! /bin/sh

eval $(xdotool getactivewindow getwindowgeometry --shell)
X=$(($X + 500))
Y=$(($Y + 400))
xdotool mousemove --sync $X $Y
