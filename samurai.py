#!/usr/bin/env python3

import os, platform, sys, socket

samuraimap = {}

# ===============================
# Functions
# ===============================

def loadoptions(ninja=False,showcmd=False):
  print("==================================")
  print("Samurai for Mac")
  print("Modes: Ninja={0},".format(ninja), "ShowCMD={0}".format(showcmd))
  print("System:","{0}".format(platform.system()),"({0})".format(platform.release()))
  print("==================================")

  for key, value in sorted(samuraimap.items()):
    if showcmd:
      print("[", key, "] -", value['name'], " ::> " , value['cmd'])
    else:
      print("[", key, "] -", value['name'])

def runcommand(cmdstring):
  return_value = os.system(cmdstring)

# ===============================
# Main Code
# ===============================

if __name__ == "__main__":

  # ===============================
  # Checks for system
  # ===============================

  if platform.system() != 'Darwin':
    print("[Samurai] System incompatible, please run samurai.py instead.")
    sys.exit(1)

  # ===============================
  # Setting arguments
  # ===============================

  ninja_active = False
  showcmd_active = False

  # Adding ninja mode here - ninja mode activated within menu
  # In ninja mode, the commands are not executed; until the end. if you run ninja, it will create a scroll.sh with bash commands which can be used with vagrant
  # export DEBIAN_FRONTEND=noninteractive
  # apt-get -y install package1 package2

  # ===============================
  # Default load of system
  # ===============================

  avatar = "[samurai]"
  gloop = True

  # ===============================
  # Entering loop of samurai
  # ===============================

  runcommand("clear")

  while gloop:
    gchoice = 9999

    loadoptions(ninja_active,showcmd_active)
    gchoice = input("================================== \n{0} What is your command? : ".format(avatar))

    if gchoice.isdigit():
      gchoice = int(gchoice)
    else:
      gchoice = 9999

    if gchoice == 0:
      break

    if gchoice == 3:
      showcmd_active = not showcmd_active       # toggle showcmd mode

    if gchoice in samuraimap:
      runcommand(samuraimap[gchoice]['cmd'])
      if not samuraimap[gchoice]['responsesuccess']:
        print("{0}".format(avatar), samuraimap[gchoice]['responsesuccess'])
    else:
      print("{0} Command is does not exist. Please enter number.".format(avatar))       #load the options again. does not work if placed in above array

    input("Enter to continue")
    runcommand("clear")
