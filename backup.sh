#!/bin/sh

dotFiles=(~/.zshrc ~/.zshrc.pre-oh-my-zsh ~/.config/Code/User/settings.json ~/.config/neofetch/config.conf)
backupDir=$"./dotfiles"

# Colours
RED='\033[0;31m'
GRE='\033[0;32m'
PU='\033[0;35m'
NC='\033[0m'

sleep 1

previousDate=$(date +%Y-%m-%d_%H-%M-%S)
if [ -e $backupDir ]; then
  tar -czf "./old/${backupDir}-${previousDate}.tar.gz2" "$backupDir"
  mkdir -p "old"
  echo -e "Saved Previous .dotfiles to ${PU}$backupDir-${previousDate}"
fi

rm -rf "$backupDir" && mkdir -p "$backupDir"; sleep 1

echo -e "Backing up..."
tput sc

for path in "${dotFiles[@]}"; do
  if [ -f "$path" ]; then
    tput rc;tput el; printf "${PU}\t$path"; cp --parents --recursive "$path" "$backupDir"
    sleep 0.5
  fi
done

printf "${GRE}\t\nBackup finished! You can review & commit your changes."
