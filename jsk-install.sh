#!/usr/bin/env bash

# Installs samurai into /usr/local/bin
# Files: samurai / samurai-mac.py / samurai-linux.py

if [[ $(id -u) != 0 ]]; then
  if command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
  else
    echo >&2 "sudo not installed ... aborting."
    exit 1
  fi
fi

if git ls-files >& /dev/null && [[ -f samurai ]]; then
  $SUDO cp samurai /usr/local/bin/samurai || { echo "Failed to install samurai into /usr/local/bin."; exit 1; }
  $SUDO cp samurai-mac.py /usr/local/bin/samurai-mac.py || { echo "Failed to install samurai-mac.py into /usr/local/bin."; exit 1; }
  $SUDO cp samurai-linux.py /usr/local/bin/samurai-linux.py || { echo "Failed to install samurai-linux.py into /usr/local/bin."; exit 1; }
else
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai -o /usr/local/bin/samurai && $SUDO chmod +x /usr/local/bin/samurai || { echo "Failed to install samurai into /usr/local/bin."; exit 1; }
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai-mac.py -o /usr/local/bin/samurai-mac.py && $SUDO chmod +x /usr/local/bin/samurai-mac.py || { echo "Failed to install samurai-mac.py into /usr/local/bin."; exit 1; }
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai-linux.py -o /usr/local/bin/samurai-linux.py && $SUDO chmod +x /usr/local/bin/samurai-linux.py || { echo "Failed to install samurai-linux.py into /usr/local/bin."; exit 1; }
fi

echo "Installed Samurai into /usr/local/bin. To uninstall, delete samurai/samurai-mac.py/samurai-linux.py from folder."; exit 0;
