#!/usr/bin/bash

HOSTNAME=$(uname -n)

pypr &

while true; do
  if ! pgrep -x pypr >/dev/null; then
    continue
  else
    if [ "$HOSTNAME" == "dell" ]; then
      sleep 2 && pypr show nchat && pypr hide nchat
    elif [ "$HOSTNAME" == "asus" ]; then
      sleep 10 && pypr show nchat && pypr hide nchat
    fi
    sleep 1
    if pgrep -x nchat >/dev/null; then
      notify-send "nchat started"
    else
      notify-send "nchat not started"
      sleep 1 && notify-send "starting nchat in 5 more seconds"
      sleep 5 && pypr show nchat && pypr hide nchat
    fi
  fi
  exit 1
done
