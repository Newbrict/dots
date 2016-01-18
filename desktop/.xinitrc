# X11 font loading
# xset +fp /usr/share/fonts/TTF
# xset fp rehash

# merge in my Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# make sure my keymap carries over
xmodmap .Xmodmap

# cursor mod
xsetroot -cursor_name tcross

# launch xmonad
exec xmonad
