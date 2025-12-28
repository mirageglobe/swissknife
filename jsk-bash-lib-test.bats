#!/usr/bin/env bats

# ====================================================== project information ===

# author      : jimmy mg lim (mirageglobe@gmail.com)
# source      : https://github.com/mirageglobe/swissknife
# license     : Apache License 2.0
# version     : 0.1.1

# --------------------------------------------------------------------- main ---

# source the script to be tested i.e. ../src/jsk-bash-lib.sh
source ./jsk-bash-lib.sh

@test "_allow_os test os" {
  local current_os
  current_os="$(uname -s)"
  run _allow_os "$current_os"
  [ "$status" -eq 0 ]
}

@test "_timestamp returns non-empty string" {
  run _timestamp
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}

@test "_datestamp returns non-empty string" {
  run _datestamp
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}
