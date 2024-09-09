#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

termux-change-repo
echo -e "${GREEN}Репозитории Termux изменены.${NC}"

termux-setup-storage
echo -e "${GREEN}Настройка доступа к хранилищу завершена. Даем время на разрешение...${NC}"
sleep 5

echo -e "${GREEN}Обновление пакетов. Продолжить? (y/n)${NC}"
read -r consent
if [[ "$consent" == "y" ]]; then
    pkg update && pkg upgrade -y
    echo -e "${GREEN}Пакеты обновлены.${NC}"
else
    echo -e "${GREEN}Обновление пакетов отменено.${NC}"
fi

echo -e "${GREEN}Установка необходимых пакетов: git, bat, zoxide, eza, zsh, tsu, cronie, termux-services, termux-tools, coreutils, dash. Продолжить? (y/n)${NC}"
read -r consent
if [[ "$consent" == "y" ]]; then
    pkg install git bat zoxide eza zsh tsu cronie termux-services termux-tools coreutils dash -y
    echo -e "${GREEN}Необходимые пакеты установлены.${NC}"
else
    echo -e "${GREEN}Установка пакетов отменена.${NC}"
fi

echo -e "${GREEN}Настройка git. Продолжить? (y/n)${NC}"
read -r consent
if [[ "$consent" == "y" ]]; then
    git config --global credential.helper store
    git config --global user.email "priscilla.effects@gmail.com"
    git config --global user.name "masajinobe-ef"
    git config --global pull.rebase false
    echo -e "${GREEN}Git настроен.${NC}"
else
    echo -e "${GREEN}Настройка git отменена.${NC}"
fi

echo -e "${GREEN}Установка Oh My Zsh. Продолжить? (y/n)${NC}"
read -r consent
if [[ "$consent" == "y" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo -e "${GREEN}Oh My Zsh установлен.${NC}"
else
    echo -e "${GREEN}Установка Oh My Zsh отменена.${NC}"
fi

echo -e "${GREEN}Клонирование тем и плагинов для Zsh. Продолжить? (y/n)${NC}"
read -r consent
if [[ "$consent" == "y" ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone --depth=1 https://github.com/hlissner/zsh-autopair ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autopair
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo -e "${GREEN}Темы и плагины для Zsh клонированы.${NC}"
else
    echo -e "${GREEN}Клонирование тем и плагинов отменено.${NC}"
fi

echo -e "${GREEN}Копирование конфигурационных файлов .zshrc и .p10k.zsh. Продолжить? (y/n)${NC}"
read -r consent
if [[ "$consent" == "y" ]]; then
    cp -r .zshrc ~/
    cp -r .p10k.zsh ~/
    echo -e "${GREEN}Конфигурационные файлы скопированы.${NC}"
else
    echo -e "${GREEN}Копирование конфигурационных файлов отменено.${NC}"
fi

echo -e "${GREEN}Скрипт завершен.${NC}"
