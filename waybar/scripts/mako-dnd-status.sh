#!/usr/bin/env bash

if [ -f /tmp/mako-dnd-pending ] || makoctl mode | tr ' ' '\n' | grep -qx "dnd"; then
  printf '{"text":"<span></span>"}\n'
else
  printf '{"text":"<span>󰂚</span>"}\n'
fi
