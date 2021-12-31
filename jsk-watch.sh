#!/usr/bin/env bash

# ====================================================== project information ===

# author      : jimmy mg lim (mirageglobe@gmail.com)
# source      : https://github.com/mirageglobe/swissknife
# version     : 0.1.0

# --------------------------------------------------------------------- main ---

# usage: ./script.sh [interval duration] [command]

if [ -z $1 ]; then
  echo "usage : $0 <interval seconds> <command>";
  echo "        $0 5 echo test me";
  exit 0;
fi

# catch interval time in seconds
time_interval=${1:-1}
shift
echo "$@"
echo $ival

while :; do
  clear
  printf "$(date) [ctrl-c to exit] \n\n"
  # bash -c "$@"
  "$@"
  sleep "$time_interval"
done
