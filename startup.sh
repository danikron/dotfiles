#! /bin/sh

case $(hostname) in
	"amunet")
		APPS=("waterfox" "signal-desktop" "qbittorrent" "spotify")
		;;
	"hathor")
		APPS=("waterfox-g4" "signal-desktop" "spotify")
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
