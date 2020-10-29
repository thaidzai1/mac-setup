#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install unzip
brew install unzip

# install vim
brew install vim

# install git
brew install git

# install vscode
curl -LO https://az764295.vo.msecnd.net/stable/d2e414d9e4239a252d1ab117bd7067f125afd80a/VSCode-darwin-stable.zip

# unzip vscode 
unzip ./VSCode-darwin-stable.zip -d ~/Applications
rm -rf ./VSCode-darwin-stable.zip
code --install-extension golang.go
code --install-extension lonefy.vscode-JS-CSS-HTML-formatter
code --install-extension oderwat.indent-rainbow
code --install-extension zhuangtongfa.material-theme

# setup vim editor
curl 'https://vim-bootstrap.com/generate.vim' --data 'editor=vim&langs=javascript&langs=go' > ~/.vimrc
cp ./.vimrc ~/.vimrc
cp ./.vimrc.local.bundles ~/.vimrc.local.bundles
vim +PlugInstall

# setup bash_profile
echo "export GOPATH=$HOME/code/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin:$HOME/bin:$HOME/flutter/bin
export GIC=$GOPATH/src/gido.vn/gic
export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion" > ~/.bash_profile

# install Go
curl -LO https://golang.org/dl/go1.15.3.darwin-amd64.pkg
installer -pkg go1.15.3.darwin-amd64.pkg -target /usr/local/go
rm -rf go1.15.3.darwin-amd64.pkg

# install zsh
rm -rf ~/.oh-my-zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./.zshrc ~/.zshrc
mkdir ~/zsh
curl -L git.io/antigen > ~/zsh/antigen.zsh

ssh-keygen -t rsa -b 4096 -C "$1"
ssh-add ~/.ssh/id_rsa
