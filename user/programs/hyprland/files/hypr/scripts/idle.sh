#!/usr/bin/env bash
#
swayidle -w \
  before-sleep 'loginctl lock-session $XDG_SESSION_ID' \
  lock '~/.config/hypr/scripts/lock.sh'
