#! /bin/sh

WORKSPACEID=$(hyprctl activeworkspace -j | jq '.id')
LARGESTWINDOW=$(hyprctl clients -j | jq -c '.[] | select(.workspace.id | contains(2))'  | jq -s 'sort_by(.size) | last' | jq '.address')
