#!/usr/bin/env bash

state_file="/tmp/mako-dnd-pending"

is_dnd() {
  makoctl mode | tr ' ' '\n' | grep -qx "dnd"
}

if is_dnd || [ -f "$state_file" ]; then
  # TURN DND OFF

  rm -f "$state_file"

  makoctl mode -r dnd
  makoctl dismiss -a -h

  notify-send -t 2000 "Do Not Disturb: Off"

else
  # TURN DND ON (delayed so notification can appear)

  touch "$state_file"

  notify-send -t 2000 "Do Not Disturb: On"

  (
    sleep 2
    makoctl mode -a dnd
    rm -f "$state_file"
  ) &
fi

pkill -RTMIN+8 waybar
