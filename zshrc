# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history


# Alias
alias e="nvim"
alias lv="lvim"
alias gogopls="go get -u -v golang.org/x/tools/gopls@master"
alias gogu="go get -u -v "
alias gog="go get -v "
alias goi="go install -v "
alias gob="go build -v "
alias gobw="GOOS=windows CGO_ENABLED=0 go build -v "
alias gobl="GOOS=linux CGO_ENABLED=0 go build -v "
alias gor="go run -v "
alias c="navi"
alias cq="navi query"
alias cs="navi search"
alias hp="export http_proxy=http://localhost:1081;export https_proxy=http://localhost:1081;export no_proxy=127.0.0.1,localhost,192.168.0.0/16"
alias nhp="unset http_proxy;unset https_proxy;unset no_proxy"

alias pacs='pacman --color always -Sl | sed -e "s: :/:; /installed/d" | cut -f 1 -d " " | fzf --multi --ansi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
alias yays='yay --color always -Sl | sed -e "s: :/:; /installed/d" | cut -f 1 -d " " | fzf --multi --ansi --preview "yay -Si {1}" | xargs -ro sudo yay -S'
alias pacr="pacman --color always -Q | cut -f 1 -d ' ' | fzf --multi --ansi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"

unalias gops

# Export
export GO111MODULE="on"
#export GOROOT=$HOME/program/go
#export GOROOT_BOOTSTRAP=$HOME/program/goboot
export GOPROXY=https://goproxy.cn,direct
export GOPATH=$HOME/workspaces/go
export EDITOR=nvim

export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH
export NAVI_PATH=$HOME/.nzlovdotfile/navi

# brew
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles/

# Flutter
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
#export ENABLE_FLUTTER_DESKTOP=true

# Source
if [ $commands[navi] ]; then
  source <(navi widget zsh)
fi

[[ ! -f ~/.zshrc_local ]] || source ~/.zshrc_local

[[ ! -f /usr/share/nvm/init-nvm.sh ]] || source /usr/share/nvm/init-nvm.sh
