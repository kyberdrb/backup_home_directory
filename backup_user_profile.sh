
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
echo

echo "Backing up list of installed packages ..."

pacman -Qe | cut -d ' ' -f1 > \
/home/andrej/github/Linux_tutorials/ARCH_installed_packages.txt

echo "The lsit of installed packages has been saved in \
\"/home/andrej/github/Linux_tutorials/ARCH_installed_packages.txt\""

echo "Backing up user profile directory ..."

BACKUP_STORAGE_PATH=$1

#su -c "time rsync -avhp --progress $HOME $BACKUP_STORAGE_PATH"
#rsync nahradit dd prikazom
dd if=/dev/sdX of=/dev/sdY bs=64K conv=noerror,sync status=progress

echo "Done!"

