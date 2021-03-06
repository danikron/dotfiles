#! /bin/sh

case $(hostname) in
	"amunet")
		APPS=("waterfox" "spotify" "telegram-desktop" "qbittorrent")
		;;
	"hathor")
		APPS=("waterfox" "spotify" "telegram-desktop")
		;;
esac

PS=$(ps -ax)

for app in ${APPS[@]}; do
	if [[ ! $(echo "$PS" | grep "$app") ]]; then
		echo "launching $app"
		eval "$app &"
	else
		echo "$app already running"
	fi
done
