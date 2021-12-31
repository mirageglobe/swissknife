#! /usr/bin/env bash

# ====================================================== project information ===

# author      : jimmy mg lim (mirageglobe@gmail.com)
# source      : https://github.com/mirageglobe/swissknife
# version     : 0.1.1

# --------------------------------------------------------------------- main ---

# usage: ./script.sh [socket or service]

set -e

FILE="/run/clamav/clamd.sock"
count=0
max=90

while [ $count -lt $max ];do
  if test -S ${FILE}; then
    echo "socket found"
    response="$(echo ping | nc -U ${FILE})"
    if [[ ${response} == "pong" ]]; then
      exit 0
    fi
    echo "socket response: ${response}"
  fi
  count=$((count+1))
  echo "${count} elapsed, retrying in 1 second"
  sleep 1
done

exit 1
