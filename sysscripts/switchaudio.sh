#! /bin/sh

ALL_SINKS=$(pactl -f json list sinks)
NUM_SINKS=$(echo $ALL_SINKS | jq length)
SELECTED_SINK=$(echo $ALL_SINKS | jq '.[].description' | tr -d '"' | sort | \
	rofi -theme-str 'entry {placeholder: "Audio sinks";}' -dmenu -i -c -l ${NUM_SINKS})

pactl set-default-sink $(echo $ALL_SINKS | \
	jq ".[] | select(.description | contains(\"$SELECTED_SINK\")) | .name" | tr -d '"')
