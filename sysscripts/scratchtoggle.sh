#! /bin/sh

SCRATCHPAD_ID=$(hyprctl clients -j | jq -r '.[] | select(.initialClass=="Scratchpad") | .address')
ACTIVE_WINDOW_ID="0x$(hyprctl activewindow | head -n 1 | cut -d' ' -f 2)"

echo $SCRATCHPAD_ID
echo $ACTIVE_WINDOW_ID

if [[ $ACTIVE_WINDOW_ID == $SCRATCHPAD_ID ]]; then
	hyprctl dispatch togglespecialworkspace scratchpad
	exit 0
fi

hyprctl dispatch focuswindow address:${SCRATCHPAD_ID} | grep -G '^ok$' && exit 0

kitty --class="Scratchpad" --title="Scratchpad" -o window_padding_width='5 5 15 5' &
