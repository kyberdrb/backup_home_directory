
#!/bin/bash

echo "Let's start"

echo
echo

echo "Backing up list of installed packages ..."

pacman -Qe | cut -d ' ' -f1 > \
/home/andrej/github/Linux_tutorials/ARCH_installed_packages.txt

echo "The lsit of installed packages has been saved in \
\"/home/andrej/github/Linux_tutorials/ARCH_installed_packages.txt\""

echo
echo "************************"
echo "CHECK DISK NAMES!"
echo

lsblk

echo "************************"
echo
echo "Cloning ..."
echo
echo From /dev/sda
echo To   /dev/sdb
echo
echo "************************"
echo "MAKE SURE, THE DISK NAMES ARE CORRECT AND NO OTHER REMOVABLE\
 STORAGE DEVICE IS CONNECTED TO THE COMPUTER!"
echo "************************"


su -c 'time dd if=/dev/sda of=/dev/sdb bs=64K conv=noerror,sync status=progress'

echo "Done!"

# Sources
# https://wiki.archlinux.org/index.php/disk_cloning#Cloning_an_entire_hard_disk
