#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
#export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"
export PRIMARY_DISPLAY="HDMI-0"

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 60 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness .5' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1; redshift -PO 5500' \
  `# Undim & lock after 10 more seconds` \
  --timer 540 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1; redshift -PO 5500; i3lock -c 282A36' \
    '' \
  `# Finally, suspend an hour after it locks` \
  --timer 3600 \
    'systemctl suspend' \
    ''
