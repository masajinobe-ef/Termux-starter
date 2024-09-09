#!/bin/bash

pkg update && pkg upgrade -y
pkg install git tsu cronie termux-services -y

termux-setup-storage

git config --global credential.helper store
git config --global user.email "priscilla.effects@gmail.com"
git config --global user.name "masajinobe-ef"
git config --global pull.rebase false
