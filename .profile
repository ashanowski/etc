#if [ -z $DISPLAY && $(tty) = /dev/tty1 ]; then
#	startx &
#	vlock $
#fi


export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

export PAGER="less"
export MANPAGER="less"
