function close_apps() {
  # required for graceful exit since many apps aren't good SIGNAL citizens
  HYPRCMDS=$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')
  hyprctl --batch "$HYPRCMDS"

  notify-send "power controls" "Closing Applications..."

  sleep 2

  COUNT=$(hyprctl clients | grep -c "class:")
  if [ "$COUNT" -eq "0" ]; then
    notify-send "power controls" "Closed Applications."
    return
  else
    notify-send "power controls" "Some apps didn't close."
    exit 1
  fi

}

case "$1" in
shutdown)
  close_apps
  systemctl -i poweroff
  ;;
reboot | restart)
  close_apps
  systemctl reboot
  ;;

suspend)
  lock_screen
  sleep 3
  systemctl suspend
  ;;

hibernate)
  lock_screen
  systemctl hibernate
  ;;

logout)
  close_apps
  hyprctl dispatch exit
  ;;

lock)
  hyprlock
  ;;

close)
  close_apps
  ;;
*)
  echo $"Usage: $0 {shutdown|reboot|suspend|hibernate|logout|lock|close}"
  exit 1
  ;;
esac
