# #!/usr/bin/env bash

# ====================================================== project information ===

# author      : jimmy mg lim (mirageglobe@gmail.com)
# source      : https://github.com/mirageglobe/swissknife
# version     : 0.1.1

# --------------------------------------------------------------- references ---

# - https://devhints.io/bash

# --------------------------------------------------------------------- main ---

# usage: ./script.sh

# ensure that dependency tools are present
command -v sftp || echo "==> tool not found : sftp" && exit 1;

sftp dh -hi .
