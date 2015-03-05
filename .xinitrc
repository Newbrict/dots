# disable touchpad when typing
syndaemon -t -k -i 2 -d &

# X11 font loading
xset +fp /usr/share/fonts/TTF
xset fp rehash

# merge in my Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# make sure my keymap carries over
xmodmap .Xmodmap

# cursor mod
xsetroot -cursor_name tcross

# start trayer
nm-applet &

# launch xmonad
exec xmonad
