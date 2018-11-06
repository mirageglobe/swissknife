#!/usr/bin/env bash

# ----- references

# ref https://google.github.io/styleguide/shell.xml#Naming_Conventions

# ----- include constants

# program base name or use $0
prog_basename=$(basename "${0}")


# ----- include functions

print_help() {
  # v0.0.1
  # Usage: my_program [command] [--option] [<argument>]
  # ref https://stackoverflow.com/questions/9725675/is-there-a-standard-format-for-command-line-shell-help-text
  # ref http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html#tag_12_01

  # Print the program help information.

  cat <<HEREDOC

SCRIPTNAME
  this utility app checks nginx config ...

  version       v0.1.0
  author/site   jimmylim (mirageglobe@gmail.com) / www.mirageglobe.com

usage:
  ${prog_basename} [command]
  ${prog_basename} [--options] [<arguments>]
  ${prog_basename} -h | --help

options:
  -h --help  Display this help information.

examples:
  ${prog_basename} -y (to confirm launch script)

HEREDOC
}

# ----- check arguments

EXPECTED_ARGS=1
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]; then
  print_help
  exit $E_BADARGS
fi

# ----- main code

MUSER="wwwprod"
echo "$DTTITLE current user folder set as: $MUSER"

# checking nginx installation

echo "$DTTITLE checking nginx"
command -v nginx >/dev/null 2>&1 || { echo >&2 "$DTTEXT nginx not installed ... [abort]"; exit 1; }

# create a file in etc/nginx/conf.d/samuraitoolkit.conf

echo "$DTTITLE checking etc/nginx/conf.d/samuraitoolkit.conf"

if [ -f /etc/nginx/conf.d/samuraitoolkit.conf ]; then
  echo "$DTTEXT found nginx config file. already installed ... [abort]"
  exit 1
else
  echo "$DTTEXT trying to create etc/nginx/conf.d/samuraitoolkit.conf"
fi

if [ -f confnginxconf.bak ]; then
  echo "$DTTEXT sample nginx config file ./confnginxconf.bak found"
  #cp -i confnginxconf.bak /etc/nginx/conf.d/samuraitoolkit.conf || { echo >&2 "$DTTEXT cannot copy ... [abort]"; exit 1; }
else
  echo "$DTTEXT sample nginx config file ./confnginxconf.bak not found ... [abort]"
  exit 1
fi

# restart nginx

echo "$DTTITLE testing and restarting nginx"
#nginx -t
#service nginx restart

echo "$DTTITLE done ... [ok]"

