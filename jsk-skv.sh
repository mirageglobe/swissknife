#!/usr/bin/env bash

# ====================================================== project information ===

# author      : jimmy mg lim (mirageglobe@gmail.com)
# source      : https://github.com/mirageglobe/swissknife
# version     : 0.1.0

# --------------------------------------------------------------------- todo ---

# - print to yaml
# - print to environment
# - search for key
# - search for value
# - import csv ( convert csv to kv )
# - import yaml ( convert 1d yaml to bkv )

# --------------------------------------------------------------------- main ---

printf "skv (shell key value db)\n\n"
printf "usage : \n\tskv [get|put|rm|check] [query] file.json\n\n"

printf "queries : \n\tperson.name='jim' maps to json { 'person' : { 'name' : 'jim' } }\n\n"
