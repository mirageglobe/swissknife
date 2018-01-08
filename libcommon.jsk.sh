# ----- information
# version 1.4.0

# ----- notes
# [›] usage:
#     source "./includebash.sh"
#     or
      # if config file exists, use the variables.
#     if [ -f includebash.sh ]; then
#       source includebash.sh
#     else
#       echo "[!] warning - includebash.sh not found. things may look uglier."
#     fi

# [›] limitations:
#     - script has to be in same directory of running

# [›] tips:
#     - exit code such as exit 0 or exit 1 in bash. 0 is successful exit, and 1 or more is failed exit

# ----- functions

bbspinner()
{
  # define a timestamp function
  local returnvar=''

  local pid=$1
  local delay=0.75
  local spinstr='|/-\'

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

bbtimestamp()
{
  # define a timestamp function
  local returnvar=''

  local returnvar=date +"%T"

  echo "$returnvar"
}

bbdatestamp()
{
  # define a datestamp function
  local returnvar=''

  local returnvar=date +"%Y%m%d%H%M%S"

  echo "$returnvar"
}

bbbackup()
{
  # backup single file via rsync and append datestamp
  # to use: ibcopy "path/to/my/folder/or/file" "path/to/destination"
  local returnvar=''

  echo "$returnvar"
}

bbcopy()
{
  # copy file via rsync
  # to use: ibcopy "path/to/my/folder/or/file" "path/to/destination"
  local returnvar=''

  echo "$returnvar"
}

bbcompress()
{
  # compress a folder and append datestamp
  # to use: ibcompress "path/to/my/folder" "outputfilename"
  local returnvar=''

  echo "$returnvar"
}

bbreplacetext()
{

  # to update variables or strings using regex (awk) or tr or sed; useful for updating variables via script
  # to use: ibupdatecontent "path/to/my/file" "findthis" "replacewiththis"
  local returnvar=''

  echo "$returnvar"
}

bbcheckinstalled()
{
  # check if application is installed
  # to use: ibcheckinstalled "applicationcommand"
  local returnvar=''

  echo "$returnvar"
}

