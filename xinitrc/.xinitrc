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

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
# exec $CK_LAUNCH_SESSION stumpwm

session=${1:-openbox}

excl() {
#  exec $CK_LAUNCH_SESSION $1
   exec ck-launch-session dbus-launch --sh-syntax --exit-with-session $1
}

case $session in
  alopex	) excl alopex;;
  awesome	) excl aswesom;;
  bspwm		) excl bspwm;;
  cwm		) excl cwm;;
  dwm		) excl dwm;;
  frankenwm ) excl startfrankenwm;;
  i3		) excl i3;;
  monster	) excl monsterwm;;
  openbox	) excl openbox-session;;
  qtile		) excl qtile;;
  subtle	) excl subtle;;
  stumpwm	) excl stumpwm;;
  wingo		) excl wingo;;
  xmonad	) excl xmonad;;
  *) excl $1;;
esac
