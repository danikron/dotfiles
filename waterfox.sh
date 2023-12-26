#! /bin/sh

bspc rule -a waterfox -o desktop='Primary:^1' locked=on
bspc rule -a waterfox -o desktop='East:^1' locked=on
/usr/bin/waterfox-g
