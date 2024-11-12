#!/usr/bin/sh

pypr &

while true; do
  if ! pgrep -x pypr >/dev/null; then
    continue
  else
    sleep 10 && pypr show nchat && pypr hide nchat &
    notify-send "nchat started"
    exit 1
  fi
done
