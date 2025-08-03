#! /bin/sh

cd "$(dirname "$0")"

# Set variables

## Dotfiles directory
SOURCEDIR=$(pwd)
## Old dotfiles directory
OLDDIR=~/dotfiles_old
## Logile
LOGFILE=~/refreshsymlinks.log

##Files and directories
cd $SOURCEDIR/homedir
FILES=$(find . -type f | cut -c 3-)
mkdir -p ~/.config
OLD_FILES=$(find ~ -maxdepth 1 -type f | grep "$FILES";find ~/.config -type f | grep "$FILES")

for file in $FILES; do
	DIRS+=("$(dirname $file)")
	DIRS+=$'\n'
done

DIRS=$(printf '%s\n' "${DIRS[@]}" | sort -u | tail -n +4)

DEP_SYM_DIRS=$(find ~/.config -xtype l | grep "$(basename -a $DIRS)")

## Old symlinks

if [[ $DEP_SYM_DIRS ]]; then
	echo -e "Deprecated directory symlinks found:\n\n$DEP_SYM_DIRS\n"
	read -p "Remove all deprecated directory symlinks? [Y/n] " -n 1 -r

	case $REPLY in
		N|n)
			echo -e "\nSymlinks blocked by broken directory symlinks will not be created."
			;;
		*)
			rm -v --interactive=none $(echo "$DEP_SYM_DIRS") >> $LOGFILE 2>&1
			echo " ...done"
			;;
	esac
fi

BROKEN_SYMS=$(find ~ -maxdepth 1 -xtype l | grep "$FILES";find ~/.config -xtype l | grep "$FILES")

if [[ $BROKEN_SYMS ]]; then
	echo -e "Broken symlinks found:\n\n$BROKEN_SYMS\n"
	read -p "Remove all broken symlinks? [Y/n] " -n 1 -r

	case $REPLY in
		N|n)
			echo -e "\nSymlinks blocked by broken symlinks will not be created."
			;;
		*)
			rm -v --interactive=none $(echo "$BROKEN_SYMS") >> $LOGFILE 2>&1
			echo " ...done"
			;;
	esac
fi

# Create backups

if [[ $OLD_FILES ]]; then
	## Create dotfiles_old in homedir
	echo -n "Creating $OLDDIR for backup of any existing dotfiles in ~ ..."
	mkdir -vp $OLDDIR >> $LOGFILE 2>&1
	echo "done"

	## Move existing dotfiles to dotfiles_old
	echo -n "Moving existing dotfiles to $OLDDIR ..."

	for file in $OLD_FILES; do
		mv -v $file $OLDDIR >> $LOGFILE 2>&1
	done

	echo "done"
fi

# Create symlinks

## Create missing directories
echo -n "Creating required directories ..."

for dir in $DIRS; do
	mkdir -vp ~/.$dir >> $LOGFILE 2>&1
done

echo "done"

## Create symlinks
echo -n "Creating symlinks ..."

for file in $FILES; do
	ln -vs $SOURCEDIR/homedir/$file ~/.$file >> $LOGFILE 2>&1
done

ln -vs $SOURCEDIR/host/config/hypr/conf/$HOSTNAME.conf $HOME/.config/hypr/conf/custom.conf >> $LOGFILE 2>&1

echo "done"

echo -e "\nLog written to $LOGFILE"
