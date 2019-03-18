
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
