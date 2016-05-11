#! /bin/zsh

battery | { read char batt }
if [[ $char != "Charging" && $batt -lt 20 ]] ; then
	zenity --warning --text '\nConnect charger.' 2> /dev/null
fi

