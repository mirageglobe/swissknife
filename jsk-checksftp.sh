# #!/usr/bin/env bash

# good references can be found:
# - https://devhints.io/bash

# === main

# ensure that dependancy tools are present
command -v sftp || echo "==> tool not found : sftp" && exit 1;

sftp dh -hi .
