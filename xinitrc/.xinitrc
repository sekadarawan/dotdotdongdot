#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -f $HOME/.Xresources ]; then
  xrdb -merge $HOME/.Xresources
fi

if [ -f $HOME/.Xmodmap ]; then
  xmodmap $HOME/.Xmodmap
fi

xsetroot -cursor_name left_ptr &

BACKLIGHT=$( xbacklight )
if [ ${BACKLIGHT%%.*} -eq 100 ]; then
    xbacklight -dec 80
fi

session=${1:-openbox}

excl() {
   exec ck-launch-session dbus-launch --sh-syntax --exit-with-session $1
}

case $session in
  alopex	  ) excl alopex;;
  awesome	  ) excl aswesom;;
  bspwm		  ) excl bspwm;;
  cwm		  ) excl cwm;;
  dwm		  ) excl dwm;;
  frankendzen ) excl startfrankendzen;;
  frankenwm   ) excl startfrankenwm;;
  i3		  ) excl i3;;
  monster	  ) excl startmonsterwm;;
  monsterdzen ) excl startmonsterdzen;;
  openbox	  ) excl openbox-session;;
  qtile		  ) excl qtile;;
  subtle	  ) excl subtle;;
  stumpwm	  ) excl stumpwm;;
  wingo		  ) excl wingo;;
  xmonad	  ) excl xmonad;;
  *) excl $1;;
esac

# vim: ft=sh:syn=sh:ts=4:sw=2:sts=2:et
