
# JSK (jimmys swissknife) #
This project has been shifted to be simply named *jimmys swiss-knife (JSK)*. JSK is a commandline application that does the following:

* converts common sound/music formats to be of mp3
* converts common video formats to be mp4 (not to be confused with mp4a which is mpeg 4 audio layer)
* converts common image formats to be optimised png (for the web/print)
* converts print compatible formatting such as image or documents to be converted to pdf

The rational for this is that there are various tools that are fully equipped to do various fine grained optimisations however this comes as a cost for complexity. The key aim for this project is to have an all in one tool that can optimise all three of the filetypes and focus on one/two commmon outputs that is suffice for general use. The trade of is simplicity vs functionality coverage. This tool focuses on simplicity and core tooling.

## How to run ##

to run and see options/help,
```
  $ sh jsk.[tool].sh
```

## Contribution guidelines ###

a few points to note before submitting PR :

- ensure this is tested on debian (as indicated in vagrantfile)

## Who to contact ##

developer : Jimmy Lim (mirageglobe@gmail.com)
