#! /bin/zsh

[[ $(xdo id -a "$PANEL_WM_NAME") ]] && pkill -fo "/bin/sh ${HOME}/.config/bspwm/panel"

~/.config/bspwm/panel &!
