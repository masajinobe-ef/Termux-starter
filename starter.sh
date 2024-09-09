#!/bin/bash

pkg update && pkg upgrade -y
pkg install git zsh tsu cronie termux-services -y

termux-setup-storage

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git config --global credential.helper store
git config --global user.email "priscilla.effects@gmail.com"
git config --global user.name "masajinobe-ef"
git config --global pull.rebase false

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/hlissner/zsh-autopair ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autopair
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp -r .zshrc ~/
cp -r .p10k.zsh ~/
