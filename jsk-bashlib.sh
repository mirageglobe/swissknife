#!/usr/bin/env bash

# ----- shell library project information
# author/site : jimmy mg lim (mirageglobe@gmail.com)
# version     : v0.3.0
# source      : https://github.com/mirageglobe/jsk

# ----- instructions
# usage:
#   # either copy and paste the function or add to source in the header of your project
#
#   source "./jsk-bashlib.sh"
#
#   # if config file exists, use the variables.
#
#   if [ -f ./jsk-bashlib.sh ]; then
#     source ./jsk-bashlib.sh
#   fi
#
# limitations:
#   - script has to be in same directory of running
#
# tips:
#   - exit code such as exit 0 or exit 1 in bash. 0 is successful exit, and 1 or more is failed exit

# ----- functions

_allow_os() {
  # allows a set of operating systems, otherwise exits
  # example _allow_os "Darwin Linux"
  local rtn_val=1
  local allowed_os_list=$1
  local current_os="NIL"

  if uname -s | grep -Fq 'Darwin'; then current_os='Darwin'; fi
  if uname -s | grep -Fq 'Linux'; then current_os='Linux'; fi

  if echo "$allowed_os_list" | grep -Fq "$current_os"; then rtn_val=0; fi

  return $rtn_val
}

_spinner() {
  # define a timestamp function
  local returnvar=''

  local pid=$1
  local delay=0.75
  local spinstr="|/-\\"

  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done

  printf "    \b\b\b\b"

  echo "$returnvar"
}

_spinner2(){
  PROC=$1
  while [ -d "/proc/$PROC" ];do
    echo -n '/^H' ; sleep 0.05
    echo -n '-^H' ; sleep 0.05
    echo -n '\^H' ; sleep 0.05
    echo -n '|^H' ; sleep 0.05
  done

  return 0
}

_timestamp()
{
  # define a timestamp function
  local returnvar=''

  local returnvar=date +"%T"

  echo "$returnvar"
}

_datestamp()
{
  # define a datestamp function
  local returnvar=''

  local returnvar=date +"%Y%m%d%H%M%S"

  echo "$returnvar"
}

_backup()
{
  # backup single file via rsync and append datestamp
  # to use: ibcopy "path/to/my/folder/or/file" "path/to/destination"
  local returnvar=''

  echo "$returnvar"
}

_copy()
{
  # copy file via rsync
  # to use: ibcopy "path/to/my/folder/or/file" "path/to/destination"
  local returnvar=''

  echo "$returnvar"
}

_compress()
{
  # compress a folder and append datestamp
  # to use: ibcompress "path/to/my/folder" "outputfilename"
  local returnvar=''

  echo "$returnvar"
}

_replace_text()
{

  # to update variables or strings using regex (awk) or tr or sed; useful for updating variables via script
  # to use: ibupdatecontent "path/to/my/file" "findthis" "replacewiththis"
  local returnvar=''

  echo "$returnvar"
}

_print_success () {
  printf "\\n\\342\\234\\224  %s\\n" "$1"
}

_print_error () {
  printf "\\n\\342\\234\\226  %s\\n" "$1"
}

_is_installed() {
  # check if application is installed
  # returns the path with true 0 or null 1
  command -v "$1" >/dev/null 2>&1

  # ref : command -v "$1" >/dev/null 2>&1 || { echo >&2 "nginx not installed ... [abort]"; exit 1; }
  # example : if _is_installed "myprogram"; then _print_success "found"; else _print_error "not found"; _die; fi
}

_is_macos() {
  rtn_val=1 #note rtn boolean for error codes is 0 = true / 1 = false (reversed with boolean statements)

  if echo "$(uname -s)" | grep -Fq 'Darwin'; then
    rtn_val=0
  fi

  return $rtn_val
}

_is_linux() {
  rtn_val=1 #note rtn boolean for error codes is 0 = true / 1 = false (reversed with boolean statements)

  if echo "$(uname -s)" | grep -Fq 'Linux'; then
    rtn_val=0
  fi

  return $rtn_val
}

_file_exists() {
  if [ -f "$1" ]; then
    true # return true or 0 (0=true); i.e num of errors = 0
  else
    false # return false or 1 (1=false); i.e. num of errors > 0
  fi
  # example : if _file_exists "myfile.txt"; then _print_success "found"; else _print_error "not found"; _die; fi
}

_directory_exists() {
  if [ -d "$1" ]; then
    true # return true or 0 (0=true); i.e num of errors = 0
  else
    false # return false or 1 (1=false); i.e. num of errors > 0
  fi
}

_parse_yaml() {
  # to use include . bash.parse.yaml.sh
  # https://gist.github.com/pkuczynski/8665367

  local prefix=$2
  local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
  sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
    -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
  awk -F$fs '{
  indent = length($1)/2;
  vname[indent] = $2;
  for (i in vname) {if (i > indent) {delete vname[i]}}
    if (length($3) > 0) {
      vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
      printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
    }
  }'
}

_yell() { echo "$0: $*" >&2; }
_die() { yell "$*"; exit 111; }
_try() { "$@" || die "cannot $*"; }
_quit() { exit 0; }

#set -e

#echo "[+] test bash script"
#echo ${BASH_SOURCE[0]}

# shows the first 2 variables
#echo "[+] show variable 0 and variable 1"
#echo $0
#echo $1

# runs the great functions above
#quit
#try echo "echotestfunction"

# exits the scripts whether run using bash command or using path
#return 0 2> /dev/null || exit 0

#_spinner2 "test"

