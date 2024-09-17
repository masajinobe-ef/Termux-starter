#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

termux-change-repo
echo -e "${GREEN}Репозитории Termux изменены.${NC}"

termux-setup-storage
echo -e "${GREEN}Настройка доступа к хранилищу завершена. Даем время на разрешение...${NC}"
sleep 5

pkg update && pkg upgrade -y
pkg install git lazygit yazi wget bat zoxide eza zsh tsu cronie ripgrep termux-services termux-tools coreutils dash -y

git config --global credential.helper store
git config --global user.email "priscilla.effects@gmail.com"
git config --global user.name "masajinobe-ef"
git config --global pull.rebase false

echo -e "${GREEN}Установить Oh My Zsh? (y/n)${NC}"
read -r consent
if [[ "$consent" == "y" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo -e "${GREEN}Oh My Zsh установлен.${NC}"
else
    echo -e "${GREEN}Установка Oh My Zsh отменена.${NC}"
fi

echo -e "${GREEN}Клонирование плагинов для Zsh. Продолжить? (y/n)${NC}"
read -r consent
if [[ "$consent" == "y" ]]; then
    git clone --depth=1 https://github.com/hlissner/zsh-autopair ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autopair
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo -e "${GREEN}Плагины для Zsh клонированы.${NC}"
else
    echo -e "${GREEN}Клонирование тем и плагинов отменено.${NC}"
fi

cp -r .zshrc ~/

echo -e "${GREEN}Скрипт завершен.${NC}"
