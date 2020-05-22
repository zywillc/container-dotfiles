#!/bin/bash
REPO_PATH=$(cd $(dirname $0);pwd)

# install zsh
apt-get update && apt-get install -y zsh
# install oh-my-zsh
curl -Lo ohmyzsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh ohmyzsh.sh --unattended

# install zsh hightlight plugin
ZSH_HOME=$HOME/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_HOME/plugins/zsh-syntax-highlighting

# link .zshrc to $HOME/.zshrc
cp $REPO_PATH/.zshrc $HOME/.zshrc

# install fzf -- ohmyzsh plugin has a bug..
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
locale-gen en_US.UTF-8

# exec zsh -l
