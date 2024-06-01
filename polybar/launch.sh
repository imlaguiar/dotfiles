#!/usr/bin/env bash

#dont forget to make this executable by assigning the file the right permissions

polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
polybar thebar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bar launched..."

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload thebar &
  done
else
  polybar --reload thebar &
fi
