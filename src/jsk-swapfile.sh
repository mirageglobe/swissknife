#!/usr/bin/env bash

# Author: Jimmy MG Lim <mirageglobe@gmail.com>
# Version: 1.0.3

# Run this script to generate a 2GB swap file
# To revert this script
# (1) delete "/swapfile  none  swap  sw  0  0 line" from  /etc/fstab
# (2) delete "vm.swappiness=10" from /etc/sysctl.conf
# (3) delete "vm.vfs_cache_pressure=50" from /etc/sysctl.conf
# (4) delete /swapfile

# TODO:
# - check OS
# - check if swapon no response
# - check

# References:
# - update swap file -> https://help.ubuntu.com/community/SwapFaq
# - make swap reference https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04

# ----- Check Arguments

EXPECTED_ARGS=1
E_BADARGS=0

DTTITLE=""
DTTEXT="   "

if [ "$#" -lt "$EXPECTED_ARGS" ]; then
  echo ""
  echo "$DTTITLE swap file deployment script:"
  echo "$DTTEXT this script converts adds a swapfile in root folder"
  echo ""
  echo "$DTTITLE usage:"
  echo "$DTTEXT $0 [options] [arguments]"
  echo "$DTTEXT $0 check                      : displays current memory allocation"
  echo "$DTTEXT $0 deploy                     : adds a 2gb swap file"
  echo ""
  echo "$DTTITLE examples:"
  echo "$DTTEXT $0 deploy"
  echo ""

  exit $E_BADARGS
fi

# ----- Main Code

echo "$DTTITLE adding virtual memory"

if [ -f /swapfile ]; then
  echo "$DTTITLE error. swapfile already found"
  exit 0
fi

echo "$DTTITLE checking current free memory"
sudo swapon -s
df -h

if [ "$1" == "deploy" ]; then
  echo "$DTTITLE making 2gb swap file"
  sudo fallocate -l 2G /swapfile

  echo "$DTTITLE setting swap file permissions"
  sudo chmod 600 /swapfile

  echo "$DTTITLE activating swap file"
  sudo mkswap /swapfile
  sudo swapon /swapfile

  echo "$DTTITLE updating fstab"
  echo "$DTTEXT writing /swapfile  none  swap  sw  0  0 to /etc/fstab"
  sudo echo "/swapfile  none  swap  sw  0  0" >> /etc/fstab

  #echo "[+] set swappiness"
  #cat /proc/sys/vm/swappiness

  echo "$DTTEXT writing vm.swappiness=10 to /etc/sysctl.conf"
  sudo echo "vm.swappiness=10" >> /etc/sysctl.conf

  echo "$DTTEXT writing vm.vfs_cache_pressure=50 to /etc/sysctl.conf"
  sudo echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf

  echo "$DTTEXT deployment complete. please reboot now if necessary. use sudo swapon -s or free -m"
fi

