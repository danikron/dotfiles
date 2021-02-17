#! /bin/sh

artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

curl -s --get "https://makeitpersonal.co/lyrics" --data-urlencode "artist=$artist" --data-urlencode "title=$title"
