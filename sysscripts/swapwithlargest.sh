#! /bin/sh

WORKSPACE_ID=$(hyprctl activeworkspace -j | jq '.id')
LARGEST_WINDOW=$(hyprctl clients -j | jq -c ".[] | select(.workspace.id | contains(${WORKSPACE_ID}))" | jq -sr 'sort_by(.size) | last | .address')

hyprctl dispatch swapwindow address:${LARGEST_WINDOW}
