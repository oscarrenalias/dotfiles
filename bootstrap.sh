#!/bin/bash
CURFOLDER=`pwd`
OS=`uname | tr '[A-Z]' '[a-z]'`

echo Current folder is $CURFOLDER
echo Current OS is $OS

echo Linking this folder to $HOME/.dotfiles
ln -s `pwd` $HOME/.dotfiles

# back things up
echo Backing things up...
if [ -f $HOME/.ssh ]; then
	mv $HOME/.ssh $HOME/.ssh.dotfiles-backup
fi

if [ -f $HOME/.profile ]; then
	mv $HOME/.profile $HOME/.profile.dotfiles-backup
fi

# configure the new links
echo Installing bash .profile
ln -s $HOME/.dotfiles/$OS/profile $HOME/.profile

echo Installing SSH files
ln -s $HOME/.dotfiles/ssh $HOME/.ssh

echo Installing Git files
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig