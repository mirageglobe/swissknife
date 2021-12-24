#!/usr/bin/env python

import os, platform, sys

if __name__ == "__main__":

  # checks for python 3
  if sys.version_info.major < 3:
    print("[samurai] samurai requires python 3.x, and you are running it as python 2.x")
    print("[samurai] you can install by running sudo apt-get install python3 or python3 samurai.py")
    sys.exit(1)

  # launch samurai (either mac or linux)
  print("[samurai] all okay ... ")

  if platform.system() == 'Darwin':
    os.system("samurai-mac.py")
  elif platform.system() == 'Linux':
    os.system("samurai-linux.py")
