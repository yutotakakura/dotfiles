#!/bin/sh


UNDER_HOMEDIR_FILES=(.zshrc .tmux.conf .gitconfig)
for file in $UNDER_HOMEDIR_FILES
do
    if [ -e ~/$file ]; then
        mv ~/$file ~/$file.org
    fi
    ln -s ~/dotfiles/$file ~/$file
done


UNDER_DOTCONFIGDIR_FILES=(nvim)
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

for file in $UNDER_DOTCONFIGDIR_FILES
do
    if [ -e ~/.config/$file ]; then
        mv ~/.config/$file ~/.config/$file.org
    fi
    ln -s ~/dotfiles/.config/$file ~/.config/$file
done
