#!/bin/sh

dot_files=(~/.zshrc ~/.zshrc.pre-oh-my-zsh ~/.config/Code/User/settings.json ~/.config/neofetch/config.conf)
backupDir=$"./dotfiles"

# Colours
RED='\033[0;31m'
GRE='\033[0;32m'
PU='\033[0;35m'
NC='\033[0m'

sleep 1

today=$(date +%Y-%m-%d_%H-%M-%S)
if [ -e $backupDir ]; then
  tar -czf "./old/${backupDir}-${today}.tar.gz2" "$backupDir"
  mkdir -p "old"
  echo -e "Saved Previous .dotfiles to ${PU}$backupDir-${today}"
fi

rm -rf "$backupDir" && mkdir -p "$backupDir"; sleep 1

echo -e "Backing up..."
tput sc

for path in "${dot_files[@]}"; do
  if [ -f "$path" ]; then
    tput rc;tput el; printf "${PU}\t$path"; cp --parents --recursive "$path" "$backupDir"
    sleep 0.5
  fi
done

printf "${GRE}\t\nBackup finished! You can review & commit your changes."
