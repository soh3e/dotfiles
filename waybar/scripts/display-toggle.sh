#!/usr/bin/env bash

PIDFILE="/tmp/display-toggle.pid"

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    kill "$(cat "$PIDFILE")"
    rm -f "$PIDFILE"

    notify-send -t 2000 -u critical "Display: Normal"
else
    systemd-inhibit --what=idle:sleep --why="Keep display on" sleep infinity &
    echo $! > "$PIDFILE"

    notify-send -t 2000 -u critical "Display: Stay On"
fi

pkill -RTMIN+10 waybar
