#!/bin/bash

#
# TODO
#
# - some of the code below could be moved to reusable functions
#

CURFOLDER=`pwd`
OS=`uname | tr '[A-Z]' '[a-z]'`

echo Current folder is $CURFOLDER
echo Current OS is $OS

echo Linking this folder to $HOME/.dotfiles
ln -s `pwd` $HOME/.dotfiles

backup_file()
{
    if [ -f $HOME/$1 ]; then
	echo Backing up $1
	# rename and overwrite previous version if exists
	mv -f $HOME/$1 $HOME/$1.dotfiles-backup
    fi
}

backup_folder()
{
    if [ -d $HOME/$1 ]; then
	echo Backing up $1
	mv -f $HOME/$1 $HOME/$1.dotfiles-backup
    fi
}

# back things up
backup_folder ".ssh"
backup_file ".profile"
backup_file ".bash_profile"
backup_file ".gitconfig"
backup_folder ".emacs.d"
backup_file ".tmux.conf"

# configure the new links
if [ -f $HOME/.dotfiles/$OS/profile ]; then
	echo Installing .profile
	ln -s $HOME/.dotfiles/$OS/profile $HOME/.profile
fi

if [ -f $HOME/.dotfiles/$OS/bash_profile ]; then
	echo Installing .bash_profile
	ln -s $HOME/.dotfiles/$OS/bash_profile $HOME/.bash_profile
fi

echo Installing SSH files
ln -s $HOME/.dotfiles/ssh $HOME/.ssh

echo Installing Git files
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig

echo Installing Emacs file
ln -s $HOME/.dotfiles/emacs.d $HOME/.emacs.d

echo Installing tmux settings
ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf

if [ "$BATCH_MODE" == 1 ]; then
    exit 0
else
    while true; do
	read -p "Would you like to install the modified keyboard layout for Russian keyboards? [y/n] " yn
	case $yn in
            [Yy]* ) echo Installing modified Xmodmap; ln -s $HOME/.dotfiles/linux/Xmodmap $HOME/.Xmodmap; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
	esac
done
fi

