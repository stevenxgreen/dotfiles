urxvtd -o -q -f
xrdb -merge $HOME/.config/X11/.Xresources
udiskie &
exec i3
