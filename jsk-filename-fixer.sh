#!/usr/bin/env bash

# ====================================================== project information ===

# author      : jimmy mg lim (mirageglobe@gmail.com)
# source      : https://github.com/mirageglobe/swissknife
# version     : 0.1.0

# --------------------------------------------------------------------- main ---

file="$1"

if [ $# -eq 0 ]
then
  echo "$(basename "$0") file"
  exit 1
fi

if [ ! "$file" ]
then
  echo "$file not a file"
  exit 2
fi

lowercase=$(echo "$file" | tr "[A-Z]" "[a-z]")

if [ -f "$lowercase" ]
then
  echo "Error - File already exists!"
  exit 3
fi

# change file name
/bin/mv "$file" "$lowercase"
