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
	[Ss]team)
		TITLE=$(xtitle "$WID")
		case $TITLE in
			"Friends List")
				echo "state = floating"
				;;
		esac
		;;
esac
