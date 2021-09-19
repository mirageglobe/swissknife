#!/usr/bin/env bash

import os, platform, sys

# ===============================
# Main Code
# ===============================

if __name__ == "__main__":

  # ===============================
  # Checks for python 3
  # ===============================

  if sys.version_info < (3, 0):
    print("[Samurai] Samurai requires Python 3.x, and you are running it as Python 2.x")
    print("[Samurai] You can install by running sudo apt-get install python3 or python3 samurai.py")
    sys.exit(1)

  # Launch samurai (either mac or linux)
  print("[Samurai] All Okay ... ")
  if platform.system() == 'Darwin':
    os.system("samurai-mac.py")
  elif platform.system() == 'Linux':
    os.system("samurai-linux.py")
