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
I'm using bash as my shell with basic prompt colors and git status prompt when cd'd into a directory with .git file in it.

Bash completion is tweaked in `.inputrc` file, prompt template for normal directories is stored in `.bashrc`.
I'm using [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt) for git repositories:

* `.git-prompt-colors.sh` stores the very basic git prompt I've tweaked a little bit (color stuff)
* `.bash-git-prompt/` is the main directory of bash-git-prompt, containing themes and various scripts managing the overall look of the prompt, symlinked to `$HOME`

## URxvt setup
I've chosen to use [URxvt](https://wiki.archlinux.org/index.php/rxvt-unicode) as my terminal, providing any tweaks in `$HOME/.Xresources`. The font is [Sauce Code Pro](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro) for Powerline - this ensures that any ticksigns and custom characters are shown properly in the git prompt. This font can be found in `.fonts/` and is symlinked to `$HOME`.

`.Xresources` contains additional configuration lines for [rofi](https://github.com/DaveDavenport/rofi), which I use to launch applications. The file itself also contains colors definitions as well as tweaks like true transparency in terminal.

!TODO


## bspwm setup
`.config/bspwm/bspwmrc` - bspwm configuration files
`.config/sxhkd/sxhkdrc` - defining keyboard shortcuts to use with bspwm


