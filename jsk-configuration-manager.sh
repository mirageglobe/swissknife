#!/usr/bin/env sh

# ====================================================== project information ===

# author      : jimmy mg lim (mirageglobe@gmail.com)
# source      : https://github.com/mirageglobe/swissknife
# version     : 0.1.0

# --------------------------------------------------------------------- main ---

# ----- common functions

yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

# ----- local functions

buildReport() {
  LOCAL_LOGIN=$1
  LOCAL_SERVER=$2

  if test [ -z "$LOCAL_LOGIN" ] || [ -z "$LOCAL_SERVER" ]; then
    echo "missing variables (login name). retype bash command to see."
  else
    echo "Logging onto server environment ($LOCAL_SERVER)"
    ssh $LOCAL_LOGIN@$LOCAL_SERVER 'sudo bash -s' < swissknife.docker-report.sh
    ssh $LOCAL_LOGIN@$LOCAL_SERVER 'tail -10 report.yml'
  fi
}

# ----- check arguments
DF_VERSION="0.1.0"
DF_TITLE="***"
DF_LINE="*** -----"
DF_TEXT="     "

# ----- check arguments

EXPECTED_ARGS=1  # expected number of arguments in command line
E_BADARGS=65                      #

if [ "$#" -lt "$EXPECTED_ARGS" ]; then
  printf "\n$DTTEXT"
  printf "\n$DTTITLE Jimmys Configuration Manager"
  printf "\n$DTTEXT JCM is a configuration tool for building and configuring machines (as well as cloud based VMs). It reads a basic jcm file (json format) which specifies the intended state and ensures the target (which can be remote or local) corresponds to the jot file specification. It WILL automatically install missing applications and highlight ones that already exist."
  printf "\n$DTTEXT"
  printf "\n$DTTITLE USAGE"
  printf "\n$DTTEXT $0 init             # initialize generates a sample jot script if none is found"
  printf "\n$DTTEXT $0 remote [IP]      # execute run default jot file script on remote"
  printf "\n$DTTEXT $0 local            # execute run default jot file script locally"
  printf "\n$DTTEXT $0 help / -h        # show commands"
  printf "\n$DTTEXT $0 version / -v     # show version number"
  printf "\n$DTTEXT"
  printf "\n$DTTITLE EXAMPLES"
  printf "\n$DTTEXT $0 -v"
  printf "\n$DTTEXT"
  exit $E_BADARGS
fi

# ----- variables

VERSION_NO="0.1.2"
DEFAULT_PASS="defaultpass"
SLIENT_INSTALL=true

#an interactive password updater will run at the end to change this password to one of your choice
#you should change this to one of your own passwords; i recommend using keepassX to generate at least 128bit unique passwords without odd non alphanumberic words; also use lower caps to ensure ease of typing in.

INSTALL_backintime=true
INSTALL_cifs=true #smb client
INSTALL_git=true
INSTALL_graphicsmagick=true
INSTALL_java7=true
INSTALL_java8=true
INSTALL_nginx=true
INSTALL_nvmnodejs=true
INSTALL_postgres=false
INSTALL_postgres93=true
INSTALL_samurai=true
INSTALL_vim=true
INSTALL_x11vncserver=true

SET_java7_default=false
SET_java8_default=true

#INSTALL_mysql=false
#INSTALL_mongodb=false
#INSTALL_sqlite=false
#INSTALL_nginx=true

#do not change variables below
SLIENT_YES="" #slient yes use for slient installs, this just appends -y or nothing

if [ $SLIENT_INSTALL ]; then
  sudo export DEBIAN_FRONTEND=noninteractive
  SLIENT_YES="-y"
fi

# ----- main code

SK_CMD=$1
SK_LOGIN=$2

case "$SK_CMD" in
  opt-1)
    echo "Logging onto local server environment"
    buildReport $SK_LOGIN 10.131.4.40
    ;;
  ls)
    echo "test ls"
    ;;
  *)
    die
esac


printf "\n$DTTEXT"
printf "\n$DTTITLE script: terracotta (v$VERSION_NO) - an auto server setup"
printf "\n$DTTEXT"

printf "\n$DTTEXT"
printf "\n$DTTEXT warning: this script is designed specifically for *buntu trusty 14.04 LTS. Lubuntu 14.04 Full highly recommended"
printf "\n$DTTEXT"

# switching to root and installing default applications
printf "\n$DTTITLE updating server as root"

if [ "$(id -u)" != "0" ]; then
   printf "\n$DTTEXT this script must be run as root. try sudo <script>" 1>&2
   exit 1
fi

sudo apt-get update $SLIENT_YES
sudo apt-get upgrade $SLIENT_YES
sudo apt-get dist-upgrade $SLIENT_YES
sudo apt-get install build-essential $SLIENT_YES
sudo apt-get install python-software-properties $SLIENT_YES
sudo apt-get install curl $SLIENT_YES

# installing selected applications

if [ $INSTALL_backintime ]; then
  printf "\n$DTTEXT installing backintime"
  sudo add-apt-repository ppa:bit-team/stable
  sudo apt-get update $SLIENT_YES
  sudo apt-get install backintime-common $SLIENT_YES
fi

if [ $INSTALL_cifs ]; then
  printf "\n$DTTEXT installing cifs"
  sudo apt-get install cifs-utils $SLIENT_YES
fi

if [ $INSTALL_git ]; then
  printf "\n$DTTEXT installing git"
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt-get update $SLIENT_YES
  sudo apt-get install git $SLIENT_YES
fi

if [ $INSTALL_graphicsmagick ]; then
  printf "\n$DTTEXT installing graphicsmagick"
  sudo apt-get install graphicsmagick $SLIENT_YES
fi

if [ $INSTALL_java7 ]; then
  printf "\n$DTTEXT installing java7"
  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get install oracle-java7-installer $SLIENT_YES
fi

if [ $INSTALL_java8 ]; then
  printf "\n$DTTEXT installing java8"
  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get install oracle-java8-installer $SLIENT_YES
fi

if [ $INSTALL_nginx ]; then
  printf "\n$DTTEXT installing nginx"
  sudo add-apt-repository ppa:nginx/stable
  sudo apt-get install nginx $SLIENT_YES
fi

if [ $INSTALL_nvmnodejs ]; then
  printf "\n$DTTEXT installing nvm for node/iojs management"
  sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
fi

if [ $INSTALL_postgres93 ]; then
  printf "\n$DTTEXT installing postgres9.3"
  sudo curl -vs https://www.postgresql.org/media/keys/ACCC4CF8.asc 2>&1 | apt-key add -
  sudo apt-get update $SLIENT_YES
  sudo apt-get install postgresql-9.3 pgadmin3 $SLIENT_YES
  printf "\ndeb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list.d/postgresql.list
fi

if [ $INSTALL_samurai ]; then
  printf "\n$DTTEXT installing samurai"
  sudo curl -LO https://raw.githubusercontent.com/mirageglobe/samurai/master/install.sh | bash
fi

if [ $INSTALL_vim ]; then
  printf "\n$DTTEXT installing vim"
  sudo apt-get install vim $SLIENT_YES
fi

if [ $INSTALL_x11vncserver ]; then
  printf "\n$DTTEXT installing x11vnc"
  sudo apt-get install x11vnc $SLIENT_YES
fi

# all the settings here

if [ $SET_java7_default ]; then
  printf "\n$DTTEXT setting default java7"
  sudo apt-get update $SLIENT_YES
  sudo apt-get install oracle-java7-set-default $SLIENT_YES
fi

if [ $SET_java8_default ]; then
  printf "\n$DTTEXT setting default java8"
  sudo apt-get update $SLIENT_YES
  sudo apt-get install oracle-java8-set-default $SLIENT_YES
fi

sudo apt-get autoremove $SLIENT_YES
printf "\n$DTTITLE COMPLETE"

# all installations complete. please run setpasswords to update individual passwords for these applications.
printf "\n$DTTEXT all installations are complete"
printf "\n$DTTEXT please reset the passwords for the applications installed."

