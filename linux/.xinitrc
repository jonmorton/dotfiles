if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -d ~/.Xresources.d ] ; then
  for f in ~/.Xresources.d/* ; do
    xrdb -merge "$f"
  done
  unset f
fi

autocutsel -fork &
autocutsel -selection PRIMARY -fork &

xset r rate 200 75

exec i3
