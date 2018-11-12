#!/usr/bin/env bash

# ----- boilerplate project information
# author/site : jimmy mg lim (mirageglobe@gmail.com)
# version     : v0.0.1
# source      : https://github.com/mirageglobe/jsk
#
# ref https://google.github.io/styleguide/shell.xml#Naming_Conventions

# building commandline with getopts
#- use getopts for commandline building

# ----- include constants

# program base name or use $0
app_basename=$(basename "${0}")
app_argv1=$(basename "${1}")

# ----- include functions

_print_help() {
  # Usage: my_program [command] [--option] [<argument>]
  # ref https://stackoverflow.com/questions/9725675/is-there-a-standard-format-for-command-line-shell-help-text
  # ref http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html#tag_12_01

  # Print the program help information.

  cat <<HEREDOC

SHELLAPP
  this utility app prints/execute helper functions to manage this application

  version       v0.1.0
  author/site   jimmylim (mirageglobe@gmail.com) / www.mirageglobe.com

usage:
  ${app_basename} [command] [<file>]
  ${app_basename} [--options] [<arguments>]
  ${app_basename} -h | --help

options:
  -h --help  Display this help information.

examples:
  sh ${app_basename}

HEREDOC
}

_is_installed() {
  # returns the path with true 0 or null 1
  command -v "$1" >/dev/null 2>&1

  # ref : command -v "$1" >/dev/null 2>&1 || { echo >&2 "nginx not installed ... [abort]"; exit 1; }
  # example : if sl_is_installed "$app_argv1"; then echo "$app_argv1 installed"; else echo "$app_argv1 not installed"; fi
}

_file_exists() {
  if [ -f "$1" ]; then
    true # return true or 0 (0=true); i.e num of errors = 0
  else
    false # return false or 1 (1=false); i.e. num of errors > 0
  fi
}

# ----- check arguments

EXPECTED_ARGS=1
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]; then
  _print_help
  exit $E_BADARGS
fi

# ----- main code

echo "$app_argv1 ... [searching]"

app_os="NIL"
app_cmd=$app_argv1

if _is_macos; then
  app_os="MAC"
elif _is_linux; then
  app_os="NIX"
fi

# default checks
if [ "$app_os" != "NIL" ]; then
  case "$app_cmd" in
    help)
      # list help
      _print_help
      ;;
    run)
      # your option for run here
      bundle exec foreman start
      ;;
    build)
      # your option for build here
      echo "app is building"
      ;;
    test)
      # your option for test here
      ;;
    *)
      die
  esac
fi
