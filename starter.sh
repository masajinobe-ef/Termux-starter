#!/bin/bash

# Изменяем репозитории Termux
termux-change-repo
echo "Репозитории Termux изменены."

# Настраиваем доступ к хранилищу
termux-setup-storage
echo "Настройка доступа к хранилищу завершена. Даем время на разрешение..."
sleep 10

# Обновляем пакеты
echo "Обновление пакетов. Продолжить? (y/n)"
read -r consent
if [[ "$consent" == "y" ]]; then
    pkg update && pkg upgrade
    echo "Пакеты обновлены."
else
    echo "Обновление пакетов отменено."
    exit 1
fi

# Устанавливаем необходимые пакеты
echo "Установка необходимых пакетов: git, bat, zoxide, eza, zsh, tsu, cronie, termux-services, termux-tools, coreutils, dash. Продолжить? (y/n)"
read -r consent
if [[ "$consent" == "y" ]]; then
    pkg install git bat zoxide eza zsh tsu cronie termux-services termux-tools coreutils dash -y
    echo "Необходимые пакеты установлены."
else
    echo "Установка пакетов отменена."
    exit 1
fi

# Настраиваем git
echo "Настройка git. Продолжить? (y/n)"
read -r consent
if [[ "$consent" == "y" ]]; then
    git config --global credential.helper store
    git config --global user.email "priscilla.effects@gmail.com"
    git config --global user.name "masajinobe-ef"
    git config --global pull.rebase false
    echo "Git настроен."
else
    echo "Настройка git отменена."
    exit 1
fi

# Устанавливаем Oh My Zsh
echo "Установка Oh My Zsh. Продолжить? (y/n)"
read -r consent
if [[ "$consent" == "y" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Oh My Zsh установлен."
else
    echo "Установка Oh My Zsh отменена."
    exit 1
fi

# Клонируем темы и плагины для Zsh
echo "Клонирование тем и плагинов для Zsh. Продолжить? (y/n)"
read -r consent
if [[ "$consent" == "y" ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone --depth=1 https://github.com/hlissner/zsh-autopair ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autopair
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "Темы и плагины для Zsh клонированы."
else
    echo "Клонирование тем и плагинов отменено."
    exit 1
fi

# Копируем конфигурационные файлы
echo "Копирование конфигурационных файлов .zshrc и .p10k.zsh. Продолжить? (y/n)"
read -r consent
if [[ "$consent" == "y" ]]; then
    cp -r .zshrc ~/
    cp -r .p10k.zsh ~/
    echo "Конфигурационные файлы скопированы."
else
    echo "Копирование конфигурационных файлов отменено."
    exit 1
fi

echo "Скрипт завершен."
