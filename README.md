
# JSK (jimmys swissknife) #

- author/site : Jimmy MG Lim (mirageglobe@gmail.com) / www.mirageglobe.com
- source : https://github.com/mirageglobe/jsk

This project has been shifted to be simply named *jimmys swiss-knife (JSK)*. JSK is a commandline application that does the following:

* converts common sound/music formats to be of mp3 - jsk.mp3.sh
* converts common video formats to be mp4 (not to be confused with mp4a which is mpeg 4 audio layer) - jsk.mp4.sh
* converts common image formats to be optimised png (for the web/print) jsk.png.sh
* converts print compatible formatting such as image or documents to be converted to pdf - jsk.pdf.sh

The rational for this is that there are various tools that are fully equipped to do various fine grained optimisations however this comes as a cost for complexity. The key aim for this project is to have an all in one tool that can optimise all three of the filetypes and focus on one/two commmon outputs that is suffice for general use. The trade of is simplicity vs functionality coverage. This tool focuses on simplicity and core tooling.

# To use #

to run and see options/help,
```
  $ sh jsk.[tool].sh
```

shellcheck treats local declarations as non POSIX, however local is widely used. enable using by added in your vimrc
```
  " allow the use of 'local'
  let g:syntastic_sh_shellcheck_args="-e SC2039"
```

# Guidelines #

a few points to note before submitting PR :

- ensure this is tested on debian (as indicated in vagrantfile)

# Roadmap #

- video: consider mkv as container (http://www.iorgsoft.com/compare/mp4-vs-mkv-comparison.html / https://www.quora.com/How-do-you-choose-between-MP4-or-MKV-format)
- video: use x264 for video compression

# License #

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

