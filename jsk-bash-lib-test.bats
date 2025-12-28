#!/usr/bin/env bats

# ====================================================== project information ===

# author      : jimmy mg lim (mirageglobe@gmail.com)
# source      : https://github.com/mirageglobe/swissknife
# version     : 0.1.1

# --------------------------------------------------------------------- main ---

# source the script to be tested i.e. ../src/jsk-bashlib.sh
source ./jsk-bashlib.sh

@test "_allow_os test os" {
  result="$(echo uname -s | _allow_os)"
  [ "$result" -eq 0 ]
}
