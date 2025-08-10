#! /bin/sh

CURRENT_CONFIG=$(readlink -f $HOME/.config/hypr/conf/custom.conf | grep -o '[^/]*$')

[[ $CURRENT_CONFIG = "amunet_trap.conf" ]] && \
	ln -sf $HOME/dotfiles/host/homedir/config/hypr/conf/amunet.conf $HOME/.config/hypr/conf/custom.conf

[[ $CURRENT_CONFIG = "amunet.conf" ]] && \
	ln -sf $HOME/dotfiles/host/homedir/config/hypr/conf/amunet_trap.conf $HOME/.config/hypr/conf/custom.conf
