#!/bin/bash

# The first parameter is the path to the external storage.
# It's the only and required parameter.

if [ "$#" -ne 1 ]; then
  echo "Illegal number of parameters"
  echo "Usage:"
  echo "$0 <path_to_external_drive>"
  echo "e.g."
  echo "$0 /run/media/andrej/3f090f89-297f-40ea-8a8e-86ae9dc3c2b4/"
  exit 1
fi

echo
echo "Let's start"
echo
echo "Set variables"
echo

BACKUP_STORAGE_PATH=$1
PACMAN_INSTALLED_PACKAGES="pacman_installed_packages.txt"

echo
echo "Adjust owner of the external drive"
echo

#sudo chown -R $USER:users /run/media/andrej/3f090f89-297f-40ea-8a8e-86ae9dc3c2b4

# Backup list of system packages
echo "Backing up list of installed packages ..."
su -c 'pacman -Q > $BACKUP_STORAGE_PATH$PACMAN_INSTALLED_PACKAGES'
echo "Done!"

# Backup files in user profile directory
echo "Backing up user profile directory ..."
su -c "time rsync -avhp --progress $HOME $BACKUP_STORAGE_PATH"
echo "Done!"

