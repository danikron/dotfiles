#! /bin/sh

bspc rule -a Waterfox -o desktop='Primary:^1' locked=on
bspc rule -a Waterfox -o desktop='East:^1' locked=on
/usr/bin/waterfox-g4
