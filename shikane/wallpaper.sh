if [ $(darkman get) = "light" ]; then
  /home/samtrek/.local/share/light-mode.d/wallpaper.sh
elif [ $(darkman get) = "dark" ]; then
  /home/samtrek/.local/share/dark-mode.d/wallpaper.sh
fi
