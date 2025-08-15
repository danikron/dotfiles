#! /bin/sh

MESSAGES=$(hyprctl clients -j | jq -r '.[] | select(.initialClass=="Signal") | .title' | tr -d -c 0-9)

if [[ $MESSAGES ]]; then
	echo ""
fi
