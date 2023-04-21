#! /bin/sh

WID=$1
CLASS=$2
INSTANCE=$3

#Debug
#TITLE=$(xtitle "$WID")
#PID=$(xdo pid "$WID")
#PTITLE=$(ps -p "$PID" -o comm=)
#echo "$PID $PTITLE $WID $CLASS $INSTANCE $TITLE" > /tmp/bspc-external-rules

#Telegram

case $CLASS in
	"TelegramDesktop")
		TITLE=$(xtitle "$WID")
		case $TITLE in
			"Media viewer")
				echo "state = fullscreen"
				;;
			*)
				echo "state = pseudo_tiled"
				echo "locked = on"
				;;
		esac
		;;

	"Signal")
		TITLE=$(xtitle "$WID")
		case $TITLE in
			"Signal Desktop Preferences")
				echo "state = floating"
				;;
			*)
				echo "state = pseudo_tiled"
				echo "locked = on"
				;;
		esac
		;;
	"Steam")
		TITLE=$(xtitle "$WID")
		case $TITLE in
			"Friends List")
				echo "state = floating"
				;;
		esac
		;;

	"Spotify")
		case $(bspc query -M | wc -l) in
			2)
				echo "desktop = East:^2"
				;;
			*)
				echo "desktop = ^2"
				;;
		esac
		;;
	"tidal-hifi")
		case $(bspc query -M | wc -l) in
			2)
				echo "desktop = East:^2"
				;;
			*)
				echo "desktop = ^2"
				;;
		esac
		;;
esac
