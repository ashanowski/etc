xrdb -merge ~/.Xresources &
xsetroot -cursor_name left_ptr &
dunst &
setxkbmap -option 'caps:ctrl_modifier' -layout pl &
xcape -e 'Caps_Lock=Escape' &
feh --bg-scale /home/gonz/etc/.config/wallpaper/wallpaper.png &
notify-send "Welcome to the Void, gonz"
compton -f &
polybar top &
sxhkd &
mpd &
/home/gonz/bin/devmon-d &
xmodmap ~/.Xmodmap &
exec bspwm
