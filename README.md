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

Bash completion is tweaked in `.inputrc` file, prompt template for normal directories is stored in `.bashrc` as `export PS1="..."`.
I'm using [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt) for git repositories:

* `.git-prompt-colors.sh` stores the very basic git prompt I've tweaked a little bit (color stuff)
* `.bash-git-prompt/` is the main directory of bash-git-prompt, containing themes and various scripts managing the overall look of the prompt, symlinked to `$HOME`

I've sourced `.bash-git-prompt/gitprompt.sh` and `.bash-git-prompt/prompt-colors.sh` in `.bashrc` so the prompt actually knows how to run and look like.

`bash-completion` is installed to enable git commands autocompletion. It is sourced in `.bashrc` as well.

## URxvt setup
I've chosen to use [URxvt](https://wiki.archlinux.org/index.php/rxvt-unicode) as my terminal, providing any tweaks in `$HOME/.Xresources`. The font is [Sauce Code Pro](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro) for Powerline - this ensures that any ticksigns and custom characters are shown properly in the git prompt. This font can be found in `.fonts/` and is symlinked to `$HOME`.

`.Xresources` contains additional configuration lines for [rofi](https://github.com/DaveDavenport/rofi), which I use to launch applications. The file itself also contains colors definitions as well as tweaks like true transparency in terminal.

Any changes to `.Xresources` will be seen after either restarting Xorg server or running `xrdb -merge .Xresources` command. 


## bspwm setup
* `.config/bspwm/bspwmrc` - [bspwm](https://github.com/baskerville/bspwm) configuration files
* `.config/sxhkd/sxhkdrc` - defining keyboard shortcuts for [sxhkd](https://github.com/baskerville/sxhkd) to use with bspwm

[bspwm](https://github.com/baskerville/bspwm) is a tiling window manager that I really like because it allows me not to leave keyboard while working on GNU/Linux - every action can be bid to a keyboard shortcut - moving windows, changing their mode to floating, changing size, etc. Such bindings are settled with [sxhkd](https://github.com/baskerville/sxhkd).

`bspwmrc` contains tweaks to overall appearance of windows, their splits, borders and workspace definitions. It also sets all the applications that are run after starting bspwm - instead of `$HOME/.xinitrc`.

`sxhkdrc` contains all the shortcuts, as stated above. **NOTE:** Use TABs instead of spaces when doing an indent inside `sxhkdrc`.

## Development

### IDE
Mostly I'm using Void to write Python code and university assignments - I'm currently using [VS Code](https://github.com/Microsoft/vscode) and [Neovim](https://github.com/neovim/neovim) as my main editors.

Visual Code Studio is used more often because it's free, open, and provides easier extensibility than Sublime Text 3.

I've switched from `vim` to `neovim` as it eases the usage of Plugins, while having 30% less source code. Neovim configuration lays in `$HOME/.config/nvim` with `init.vim` being the main file containing all the tweaks (equal to `.vimrc` for casual vim). The config was copied from [fisa-nvim-config](http://nvim.fisadev.com/) with some personalization. I use neovim as my typical terminal text editor.

### Python
I'm running Python versions 3.6.8 and 3.7.2, each installed to its own virtual environment. This is set up using `virtualenv` and `virtualenvwrapper`.
`.bashrc` contains exports for virtualenvs home directory, disables viewing env in the prompt when PS1 is not set and aliases for every env. 

There's a function defined inside `.bashrc` called `virtualenv_info()` that checks whether any virtual env is currently active and sets `$VENAME` variable to version of Python that runs on that env. This variable is then used by PS1 and git prompt to show the current version of Python if using virtual env.
