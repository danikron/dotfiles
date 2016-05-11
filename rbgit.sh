#! /bin/sh
echo "Rebuilding GitHub projects..."
sudo aura -Aa $(pacman -Qqm | grep git)
