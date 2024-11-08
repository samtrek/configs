function check_sound() {
  playerstatus=$(playerctl status)
  if [[ $playerstatus == "Playing" ]]; then
    notify-send "media is playing"
    exit 1
  else
    hyprlock
  fi
  #check if sound is playing and prevent sleep
}

check_sound
