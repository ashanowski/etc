#if [ -z $DISPLAY && $(tty) = /dev/tty1 ]; then
#	startx &
#	vlock $
#fi

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

export PATH=$HOME/.bash-git-prompt:$PATH
export PATH=$HOME/usr/neurosys/freertos/esp/xtensa-esp32-elf/bin:$PATH:

export PAGER="less"
export MANPAGER="less"
source $HOME/.bashrc

