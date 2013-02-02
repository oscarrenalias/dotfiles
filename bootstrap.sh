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

# back things up
echo Backing things up...
if [ -f $HOME/.ssh ]; then
	echo Backing up SSH keys
	mv $HOME/.ssh $HOME/.ssh.dotfiles-backup
fi

if [ -f $HOME/.profile ]; then
	echo Backing up .profile
	mv $HOME/.profile $HOME/.profile.dotfiles-backup
fi

if [ -f $HOME/.bash_profile ]; then
	echo Backing up .bash_profile
	mv $HOME/.bash_profile $HOME/.bash_profile.dotfiles-backup
fi

if [ -f $HOME/.gitconfig ]; then
	echo Backing up .gitconfig
	mv $HOME/.gitconfig $HOME/.gitconfig.dotfiles-backup
fi

if [ -d $HOME/.emacs.d ]; then
	echo Backing up .emacs.d
	mv $HOME/.emacs.d $HOME/.emacs.d.dotfiles-backup
fi


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

while true; do
    read -p "Would you like to install the modified keyboard layout for Russian keyboards? [y/n] " yn
    case $yn in
        [Yy]* ) echo Installing modified Xmodmap; ln -s $HOME/.dotfiles/linux/Xmodmap $HOME/.Xmodmap; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
