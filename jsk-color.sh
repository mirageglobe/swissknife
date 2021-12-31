#!/usr/bin/env bash

# ====================================================== project information ===

# author      : jimmy mg lim (mirageglobe@gmail.com)
# source      : https://github.com/mirageglobe/swissknife
# version     : 0.1.0

# --------------------------------------------------------------------- main ---

# diff -u $1 $2 | sed "s/^-/$(tput setaf 1)&/; s/^+/$(tput setaf 2)&/; s/^@/$(tput setaf 6)&/; s/$/$(tput sgr0)/"
# diff -y $1 $2 | sed "s/^</$(tput setaf 1)&/; s/^>/$(tput setaf 2)&/; s/$/$(tput sgr0)/"

# usage() {
# 	echo "show-ansi-colors <n>"
# 	exit 0
# }

# (( $# < 1 )) && usage

echo -e "\033[0mNC (No color)"
echo -e "\033[1;37mWHITE\t\033[0;30mBLACK"
echo -e "\033[0;34mBLUE\t\033[1;34mLIGHT_BLUE"
echo -e "\033[0;32mGREEN\t\033[1;32mLIGHT_GREEN"
echo -e "\033[0;36mCYAN\t\033[1;36mLIGHT_CYAN"
echo -e "\033[0;31mRED\t\033[1;31mLIGHT_RED"
echo -e "\033[0;35mPURPLE\t\033[1;35mLIGHT_PURPLE"
echo -e "\033[0;33mYELLOW\t\033[1;33mLIGHT_YELLOW"
echo -e "\033[1;30mGRAY\t\033[0;37mLIGHT_GRAY"
echo ""

show_colors() {
  local colors=$1
  echo "showing $colors ansi colors:"
  for (( n=0; n < $colors; n++ )) do
    if [[ $(( n % 8 )) == 0 ]]; then
      printf "\n"
    fi
    printf "$(tput setaf $n)%d\t$(tput sgr0)" $n
  done
  echo
}

# show_colors "$@"
show_colors 16
show_colors 256
