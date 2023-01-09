#! /bin/sh
sudo reflector --country 'Sweden' --country 'Norway' --country 'Denmark' --protocol https --latest 200 --age 24 --sort rate --save /etc/pacman.d/mirrorlist; rm -f /etc/pacman.d/mirrorlist.pacnew
