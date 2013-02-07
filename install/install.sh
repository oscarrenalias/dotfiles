#!/bin/bash

which git > /dev/null
if [ $? == 1 ]; then
    echo Please install git first
    exit 1
fi

current_folder=`basename $PWD`
if [ "$current_folder" == "install" ]; then
    echo "This script is used for remote installations of Oscar's dotfiles and there is no need to run it locally"
    exit 1
fi

echo === Cloning dotfiles repository ===
git clone https://github.com/oscarrenalias/dotfiles.git

echo === Running bootstrap script ===
cd dotfiles && ./bootstrap.sh

exit 0