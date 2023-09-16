#!/usr/bin/env bash

down() {
pamixer -u
pamixer -d 5
volume=$(pamixer --get-volume)
[ $volume -gt 0 ] && volume=`expr $volume`  
prec=`echo "scale=2; $volume / 100" | bc`
avizo-client --progress=$prec --time=0.5 --background="#222" --foreground="#f39c12"
}

up() {
pamixer -u
pamixer -i 5
volume=$(pamixer --get-volume)
[ $volume -lt 100 ] && volume=`expr $volume`  
prec=`echo "scale=2; $volume / 100" | bc`
avizo-client --progress=$prec --time=1
}

mute() {
muted="$(pamixer --get-mute)"
if $muted; then
  pamixer -u
  notify-send "Unmuted"
else 
  pamixer -m
  notify-send "Muted"
fi
}

case "$1" in
  up) up;;
  down) down;;
  mute) mute;;
esac
