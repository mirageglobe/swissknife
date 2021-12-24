#!/usr/bin/env bats

# source the script to be tested
source ../src/jsk-bashlib.sh

@test "_allow_os test os" {
  result="$(echo uname -s | _allow_os)"
  [ "$result" -eq 0 ]
}
