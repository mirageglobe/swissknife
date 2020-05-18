
# JSK (jimmys swissknife) #

- maintainer : Jimmy MG Lim (mirageglobe@gmail.com) / www.mirageglobe.com
- source : https://github.com/mirageglobe/jsk

TLDR : An opinionated swissknife cli tool for conversions to mp3(music)/mp4(video)/pdf(document)/png(image) based to standard format(s)

This project has updated to be simply : *jimmys swiss-knife (JSK)*. JSK is a commandline set of bash scripts that consists of the following:
This project has been shifted to be simply named jimmys swapfile (JSF). JSF is a commandline application that does the following:

* src/jsk-cm.sh - simple configuration manager
* src/jsk-checkservice.sh - checks if sockets are running as services
* src/jsk-checksftp.sh - checks if secure ftp is present
* src/jsk-filenamer.sh - safe renames file to lowercase and hyphens (url compatible)
* src/jsk-kvdb.sh - simple json db tool
* src/jsk-mp3.sh - converts common sound/music formats to be of mp3 
* src/jsk-mp4.sh - converts common video formats to be mp4 (not to be confused with mp4a which is mpeg 4 audio layer)
* src/jsk-png.sh - converts common image formats to be optimised png (for the web/print)
* src/jsk-pdf.sh - converts print compatible formatting such as image or documents to be converted to pdf
* src/jsk-sqldb.sh - simple sql db backup and restore tool
* src/jsk-swapfile.sh - sets up a swapfile in most linux distros

The rational for this is that there are various tools that are fully equipped to do various fine grained optimisations however this comes as a cost for complexity. The goal of this project is to have an all in one tool that can optimise all three of the filetypes and focus on one/two commmon outputs that is suffice for general use. The trade of is simplicity vs functionality coverage, where this tool focuses on specifically on simplicity and core tooling.

# Package information

jsk.swapfile.sh configures cache pressure for prioritising inode and dentry information lookup. The rational for this is that defined memory, even in instances are finite and often an issue during memory bursts. A way around this, which has been a solution for sometime, is by creating a swapfile. This allows rarely used information to be moved and stored into this file. In the past, harddisks are slow thus swapfile memory performances are nowhere close to RAM. Nowadays, SSDs(solid state harddisks) perform much faster and thus swapfiles are quite reliable. Jimmys SwapFile basically configures this and creates a basic 1gb swapfile in the root directory of your instance.

jcm (jimmys configuration manager) is a configuration management tool that focuses on compatibility and ease of use. jcm itself is a local configuration manager that "ensures" that either an application or file/folder MUST exist on the local machine. By default it will NOT remove applications or files/folders but you can use it to highlight anything that exists but should not be there. It reads a basic jcm file (json format) which specifies the intended state and ensures the target (which can be remote or local) corresponds to the jot file specification. It WILL automatically install missing applications and highlight ones that already exist." This is still beta mode so refrain from running in production before testing. The script itself is very simple and you should not find any trouble reading it. It is currently aimed for operating only on debian (and in some sense ubuntu).

jdm (jimmys database ,anager) is a client cli tool that allows standard database management such as status, backup and deployments. it features these functionality for both local and remote machines (via using user, IP address and port (optional). key goals is to create a bare dependancy less tool that can be used to manage basic os machines such as debian.

# To use #

to run and see options/help,

```
$ sh jsk-[tool].sh
```

to use swapfile swissknife,

```
$ sh jsk-swapfile.sh                  # show help
$ sh jsk-swapfile.sh apply            # launch deploy of 2gb swapfile
```

to use configuration management swissknife,

```
$ sh jsk-cm.sh                        # show menu options
$ sh jsk-cm.sh plan                   # show what changes
$ sh jsk-cm.sh apply                  # deploy these options
```

to use database tool swissknife,

```
$ sh jsk-sqldb.sh                     # sql database backup and restore tool
```

# Guidelines #

a few points to note before submitting PR :

* ensure this is tested on debian (as indicated in vagrantfile)

several caveats on this project :

shellcheck treats local declarations as non POSIX, however local is widely used. enable using by added in your vimrc

```
" allow the use of 'local'
let g:syntastic_sh_shellcheck_args="-e SC2039"
```

jimmy configuration manager specific :

there are different flavours of linux. the default command list is debian ubuntu. sorry, but thats life. good news is that you can still create yum or pacman or other flavours using raw prefix. raw.12.1.2 will run bourne shell scripts. a few points to note before submitting PR :

* ensure this is tested on debian (as indicated in vagrantfile)
* use json files "_comment": "" as comments

- there are different flavours of linux. the default command list is must support debian ubuntu at minumum.
- bourne shell script (POSIX defined) is used and not bash which is not compliant in all flavours of unix/linux. For bourne shell, if you have experience in bash scripting, it will be similar but have less features such as missing arrays. Rational for this is that ubuntu has moved to using dash as well as other distros using different flavors. Classic shell which is bourne shell (sh) scripts are POSIX standard and are by default accepted in all linux distros.

jimmys database tool specific :

a few points to note before submitting PR :

- ensure this is tested on debian (as indicated in vagrantfile)

# Roadmap #

- video: consider mkv as container (http://www.iorgsoft.com/compare/mp4-vs-mkv-comparison.html / https://www.quora.com/How-do-you-choose-between-MP4-or-MKV-format)
- video: use x264 for video compression
- swapfile: multiple level user permissions check (running as sudo or root for swapfile init)

jimmy configuration manager

* support raw folder for custom native shell scripts
* use default.json, custom.json for input rules. any scroll can be created in camp folder http://stackoverflow.com/questions/2835559/parsing-values-from-a-json-file-in-python
* check packages option to see a summary of what is installed.
* add unit test (https://github.com/kward/shunit2)
* add fail2ban in core scroll
* add caffeine in linux
* install to home directory and symlink commands
* future tooling prototype for sub-scripting

prototype example:

```
{
  "scrollname" : "myfirstscroll",
  "scrolldescription" : "this scroll does A B C."
  "scrollscript" :
  {
    "command.1" : "",
    "command.2" : "",
  }
}
```

jimmys database tool

* check db backup file health
* check db operation connection health
* support mysql/mariadb
* support couchdb
* support mongodb
* add unit test (https://github.com/kward/shunit2) or (https://github.com/bats-core/bats-core)
* push and pull standard flat files (to support json or other flat file dbs)
* install to commandline executable by user (/Users/usr/.jdm)
* uninstall option which removes from bin
* add to homebrew

# References

* http://www.shellhacks.com/en/Running-Commands-on-a-Remote-Linux-Server-over-SSH

other notes for commands

```
Restart Apache {
  sudo /usr/sbin/apachectl restart
}
```

- http://graphemica.com
- https://stackoverflow.com/questions/13777387/check-for-ip-validity
- http://www.shellhacks.com/en/Running-Commands-on-a-Remote-Linux-Server-over-SSH
- http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html#tag_02_06

```
check for open ports {
  nmap
  netstat | grep
}
```

# License

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

