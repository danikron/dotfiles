#! /bin/sh

bspc rule -a Vivaldi-stable -o desktop='Primary:^1' locked=on
bspc rule -a Vivaldi-stable -o desktop='East:^1' locked=on
/usr/bin/vivaldi-stable
