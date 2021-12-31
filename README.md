
# swissknife jsk (jimmys swissknife)

- maintainer : jimmy mg lim <mirageglobe@gmail.com> / <https://www.mirageglobe.com>
- source : <https://github.com/mirageglobe/swissknife>

tldr : an opinionated collection of scripts and tools to help standardise conversions such as ( mp3(music) / mp4(video) / pdf(document) / png(image) ) and general cli tooling to save time

this project has updated to be simply : *jimmys swiss-knife (jsk)* or *swiss-knife*. the scripts in jsk can be independantly run and consists (not only) of the following:

- ./jsk-bash-lib.sh - simple bash library helper functions for building bash apps
- ./jsk-configuration-manager.sh - simple configuration management tool
- ./jsk-check-socket.sh - checks if sockets are running as services
- ./jsk-check-sftp.sh - checks if secure ftp is present
- ./jsk-filename-fixer.sh - safe renames file to lowercase and hyphens (url compatible)
- ./jsk-kvdb.sh - simple json db tool
- ./jsk-skv.sh - apparently another simple json db tool experiment (kvdb)
- ./jsk-sqldb.sh - simple sql db backup and restore tool
- ./jsk-swapfile.sh - sets up a swapfile in most linux distros
- ./jsk-mp3.sh - converts common sound/music files to be mp3 format
- ./jsk-mp4.sh - converts common video files to be mp4 format (not to be confused with mp4a which is mpeg 4 audio layer)
- ./jsk-png.sh - converts common image formats to be optimised png (for the web/print)
- ./jsk-pdf.sh - converts print compatible formatting such as image or documents to be converted to pdf
- ./jsk-samurai.py - simple script to run custom cli commands
- ./jsk-color.sh - show color chart
- ./jsk-watch.sh - simple watch command auto ticker that refreshes every X seconds
- ./jsk-ensure.sh - simple command checker
- ./jsk-install.sh - example installer script for bash or executable tools
- ./jsk-system-check.py - checks system configuration
- ./jsk-utf8-convert.sh - simple utf8 encoding reader

other tools are included/collected here as a reference point:

- ./jsk-decode-vbe.py - tool provided to decode vbe files

the rational for this is that there are many tools that are fully equipped to do various fine grained optimisations; however this comes as a cost for complexity. the goal of this project is to have an all in one tool that can simple provide simple use cases to do tasks such as optimise filetypes and focus on one/two common outputs that is suffice for general use. the trade of is simplicity vs functionality coverage, where this tool focuses on specifically on simplicity and core tooling.

# usage

to run and see options/help,

```sh
bash ./jsk-<tool name>.sh
```

to use swapfile,

```sh
bash ./jsk-swapfile.sh                  # show help
bash ./jsk-swapfile.sh apply            # launch deploy of 2gb swapfile
```

to use sql database tool,

```sh
bash ./jsk-sqldb.sh                     # sql database backup and restore tool
```

# package information

## jsk-swapfile.sh

configures cache pressure for prioritising inode and dentry information lookup. the rational for this is that defined memory, even in instances are finite and often an issue during memory bursts. a way around this, which has been a solution for sometime, is by creating a swapfile. this allows rarely used information to be moved and stored into this file. in the past, harddisks are slow thus swapfile memory performances are nowhere close to ram. nowadays, ssds(solid state harddisks) perform much faster and thus swapfiles are quite reliable. jimmys swapfile basically configures this and creates a basic 1gb swapfile in the root directory of your instance.

## jsk-configuration-manager.sh

jsk-cm.sh (jimmys configuration manager tool) is a configuration management tool that focuses on compatibility and ease of use. jsk-cm itself is a local configuration manager that "ensures" that either an application or file/folder must exist on the local machine. by default it will not remove applications or files/folders but you can use it to highlight anything that exists but should not be there. it reads a basic jsk-cm file (json format) which specifies the intended state and ensures the target (which can be remote or local) corresponds to the jot file specification. it will automatically install missing applications and highlight ones that already exist." this is still beta mode so refrain from running in production before testing. the script itself is very simple and you should not find any trouble reading it. it is currently aimed for operating only on debian (and in some sense ubuntu).

## jsk-sqldb.sh

(jimmys sql database tool) is a client cli tool that allows standard database management such as status, backup and deployments. it features these functionality for both local and remote machines (via using user, IP address and port (optional). key goals is to create a bare dependancy less tool that can be used to manage basic os machines such as debian.

# guidelines

- there are different flavours of linux. the default command list is must support debian ubuntu at minumum.
- bourne shell script (POSIX defined) is used and not bash which is not compliant in all flavours of unix/linux. For bourne shell, if you have experience in bash scripting, it will be similar but have less features such as missing arrays. Rational for this is that ubuntu has moved to using dash as well as other distros using different flavors. Classic shell which is bourne shell (sh) scripts are POSIX standard and are by default accepted in all linux distros.

a few points to note before submitting PR :

- ensure that this is tested on debian (as provided in vagrantfile)

## shellcheck

shellcheck can be installed using homebrew

```sh
brew install shellcheck
```

shellcheck treats local declarations as non POSIX, however local is widely used. enable using by added in your vimrc

```vim
" using syntastic
" allow the use of 'local'
let g:syntastic_sh_shellcheck_args="-e SC2039"
```

# roadmap

each script will have a list of todos and roadmap. general roadmap for swissknife:

- video: consider mkv as container <http://www.iorgsoft.com/compare/mp4-vs-mkv-comparison.html> / <https://www.quora.com/How-do-you-choose-between-MP4-or-MKV-format>
- video: use x264 for video compression
- swapfile: multiple level user permissions check (running as sudo or root for swapfile init)

# references

- <https://stackoverflow.com/questions/13777387/check-for-ip-validity>
- <http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html#tag_02_06>
- <http://www.shellhacks.com/en/Running-Commands-on-a-Remote-Linux-Server-over-SSH>
- <http://graphemica.com>

when adding shell(sh/bash) commands, you can chain commands with four ways:

```sh
# ; = run regardless
# && = run if previous succeed
# || = run if previous fail
# & run in background
```

when returning error codes refer to <http://tldp.org/LDP/abs/html/exitcodes.html>

```text
1             catchall for general errors
2             misuse of shell builtins
126           command invoked cannot execute
127           command not found
128           invalid argument to exit
128+n         fatal error signal "n"
130           script terminated by control-c
255           exit status out of range
```

when commenting in json files

```json
{
  "_comment": "this is an example comment"
}
```

other useful bash commands

```bash
restart_apache {
  sudo /usr/sbin/apachectl restart
}

check_for_open_ports {
  nmap
  netstat | grep
}
```

# license

```text
Copyright 2012 Jimmy MG Lim (mirageglobe@gmail.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

License Breakdown: https://tldrlegal.com/license/apache-license-2.0-(apache-2.0)
```
