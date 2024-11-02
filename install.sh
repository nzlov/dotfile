#!/bin/sh
git clone https://github.com/nzlov/dotfile ~/.nzlovdotfile
ln -sf ~/.nzlovdotfile/config/* ~/.config
mv ~/.zshrc ~/.zshrc.bak
ln -s ~/.nzlovdotfile/zshrc.zi ~/.zshrc
source ~/.zshrc
# tmux
mv ~/.tmux.conf ~/.tmux.conf.bak
ln -s ~/.nzlovdotfile/tmux.conf ~/.tmux.conf
mv ~/.tmux.conf.local ~/.tmux.conf.local.bak
cp ~/.nzlovdotfile/tmux.conf.local ~/.tmux.conf.local
