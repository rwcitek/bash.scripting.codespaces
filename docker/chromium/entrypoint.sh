#!/bin/bash

# 1. Start virtual display
Xvfb :0 -screen 0 1280x800x24 &
sleep 2

# 2. Start window manager
openbox &
sleep 1

# 4. Launch NetLogo 7.0.4
while true; do
  DISPLAY=:0 chromium --no-sandbox --disable-dev-shm-usage https://google.com
  sleep 2
done &

# 5. Start VNC server
x11vnc -display :0 -forever -nopw &
sleep 1

# 6. Start Web proxy
exec websockify --web /usr/share/novnc/ 6080 localhost:5900


