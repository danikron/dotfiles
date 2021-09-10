#! /bin/sh

SPEAKERS="alsa_output.usb-GFEC_ASSP_DigiHug_USB_Audio-01.analog-stereo"
HEADPHONES="alsa_output.usb-SteelSeries_SteelSeries_Arctis_7-00.stereo-game"

pactl info | grep -F -e "Default Sink: ${SPEAKERS}" > /dev/null && pactl set-default-sink ${HEADPHONES} || pactl set-default-sink ${SPEAKERS}

~/.config/bspwm/panel_resources/volume > "$PANEL_FIFO"

