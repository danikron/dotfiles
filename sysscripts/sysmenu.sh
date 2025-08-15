#! /bin/bash

case "$(printf "Monitor\nKill process\nSleep\nReboot\nShutdown" | rofi -theme-str 'entry {placeholder: "System calls";}' -dmenu -i -c -l 4)" in
	'Monitor') kitty 'btop' ;;
	'Kill process') ps -u $USER -o comm,%cpu,%mem,pid --sort -pcpu | rofi -theme-str 'entry {placeholder: "Search processes";}' -dmenu -i -c -l 10 -p Kill: | awk '{print $1}' | xargs -r kill ;;
	Sleep) slock systemctl suspend -i ;;
	Reboot) systemctl reboot -i ;;
	Shutdown) shutdown now ;;
	*) exit 1 ;;
esac
