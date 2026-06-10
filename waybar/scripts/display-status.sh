#!/usr/bin/env bash

PIDFILE="/tmp/display-toggle.pid"

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    printf '{"text":"<span>󰛨</span>"}\n'
else
    printf '{"text":"<span>󰹏</span>"}\n'
fi
