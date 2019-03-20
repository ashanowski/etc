# Void Linux config files

##  System information

```
OS: Void Linux
Shell: bash 5.0.2
WM: bspwm
term: urxvt
```
! TODO: store apps names in txt file
### Last update: 14 Mar 2019

My current /home/user tree looks like this
```
/home/gonz
├── bin
├── etc
├── src
├── usr
└── var
5 directories, 0 files
```

* `bin` - personal scripts, directory appended to ```$PATH``` 
* `etc` - storing config files that are symlinked to ```/home/user``` and other locations
* `src` - directory for source files, I'm using it to store various scripts, sorted by language
* `usr` - personal files like images, music, scrots and other
* `var` - directory used to sort files to other destinations

## Bash setup
I'm using bash version 5.0.2 with basic prompt colors and git status prompt when cd'd into a directory with .git file in it.

Bash completion is tweaked in ```.inputrc``` file, prompt template for normal directories is stored in ```.bashrc```.
I'm using [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt) for git repositories:

* `.git-prompt-colors` stores the very basic git prompt I've tweaked a little bit (color stuff)


## bspwm setup
`.config/bspwm/bspwmrc` - bspwm configuration files
`.config/sxhkd/sxhkdrc` - defining keyboard shortcuts to use with bspwm

## URxvt setup
TODO
