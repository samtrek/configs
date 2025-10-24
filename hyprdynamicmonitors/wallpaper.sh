if [ $(darkman get) = "light" ]; then
  swww img -o eDP-1 /home/samtrek/Documents/walpapers/demon.jpg
  swww img -o DP-2 /home/samtrek/Documents/walpapers/demon.jpg
elif [ $(darkman get) = "dark" ]; then
  swww img -o eDP-1 /home/samtrek/Documents/walpapers/demon3.jpg
  swww img -o DP-2 /home/samtrek/Documents/walpapers/spy2.jpg
fi
