#!/bin/sh
git clone https://github.com/nzlov/dotfile ~/.nzlovdotfile
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
rm ~/.zshrc
ln -s ~/.nzlovdotfile/zshrc.antigen ~/.zshrc
source ~/.zshrc
#vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
rm ~/.vimrc
ln -s ~/.nzlovdotfile/vimrc.nvim-completion-manager ~/.vimrc
ln -s ~/.nzlovdotfile/colors ~/.vim/colors
# neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.nzlovdotfile/vimrc.nvim-completion-manager ~/.config/nvim/init.vim
ln -s ~/.nzlovdotfile/colors ~/.config/nvim/colors
# tmux
rm ~/.tmux.conf
ln -s ~/.nzlovdotfile/tmux.conf ~/.tmux.conf
rm ~/.tmux.conf.local
cp ~/.nzlovdotfile/tmux.conf.local ~/.tmux.conf.local
