#!/bin/sh
git clone https://github.com/nzlov/dotfile ~/.nzlovdotfile
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
rm ~/.zshrc
ln -s ~/.nzlovdotfile/zshrc.v2 ~/.zshrc
#source ~/.zshrc
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
rm ~/.vimrc
ln -s ~/.nzlovdotfile/vimrc ~/.vimrc
rm ~/.tmux.conf
ln -s ~/.nzlovdotfile/tmux.conf ~/.tmux.conf
rm ~/.tmux.conf.local
cp ~/.nzlovdotfile/tmux.conf.local ~/.tmux.conf.local
