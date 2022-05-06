#! /bin/sh

WID=$1
CLASS=$2
INSTANCE=$3

#Debug
#TITLE=$(xtitle "$WID")
#echo "$WID $CLASS $INSTANCE $TITLE" > /tmp/bspc-external-rules

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

	"Steam")
		TITLE=$(xtitle "$WID")
		case $TITLE in
			"Friends List")
				echo "state = floating"
				;;
		esac
		;;

	"")
		case $(exec ps -p "$(exec xdo pid "$WID")" -o comm= 2> /dev/null) in
			"spotify")
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
		;;
esac
