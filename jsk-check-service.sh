#! /usr/bin/env bash

set -e

FILE="/run/clamav/clamd.sock"
count=0
max=90

while [ $count -lt $max ];do
  if test -S ${FILE}; then
    echo "Socket Found"
    response="$(echo PING | nc -U ${FILE})"
    if [[ ${response} == "PONG" ]]; then
      exit 0
    fi
    echo "Socket Response: ${response}"
  fi
  count=$((count+1))
  echo "${count} elapsed, retrying in 1 second"
  sleep 1
done

exit 1
