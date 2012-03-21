#!/bin/sh
# streadway - .xinitrc
# Fully expanded out from a stock X11 install and XDarwin install.  This doesn't
# dip into any customization directories like /opt/X11/lib/X11/xinit/xinitrc.d/*.sh

. $HOME/.profile

export USERWM=`which xmonad`

for path in /opt/X11 /usr/X11 ; do
  if [ -d $path ]; then
    X11=$path
    break
  fi
done

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=$X11/lib/X11/xinit/.Xresources
sysmodmap=$X11/lib/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
  if [ -x /usr/bin/cpp ] ; then
    xrdb -merge $sysresources
  else
    xrdb -nocpp -merge $sysresources
  fi
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  if [ -x /usr/bin/cpp ] ; then
    xrdb -merge "$userresources"
  else
    xrdb -nocpp -merge "$userresources"
  fi
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# expand out the scripts found in 

# Configure fonts
if [ -x $X11/bin/xset ] ; then
  fontpath="$X11/lib/X11/fonts/misc/,$X11/lib/X11/fonts/TTF/,$X11/lib/X11/fonts/OTF,$X11/lib/X11/fonts/Type1/,$X11/lib/X11/fonts/75dpi/:unscaled,$X11/lib/X11/fonts/100dpi/:unscaled,$X11/lib/X11/fonts/75dpi/,$X11/lib/X11/fonts/100dpi/"

  [ -e "$HOME"/.fonts/fonts.dir ] && fontpath="$fontpath,$HOME/.fonts"
  [ -e "$HOME"/Library/Fonts/fonts.dir ] && fontpath="$fontpath,$HOME/Library/Fonts"
  [ -e /Library/Fonts/fonts.dir ] && fontpath="$fontpath,/Library/Fonts"
  [ -e /System/Library/Fonts/fonts.dir ] && fontpath="$fontpath,/System/Library/Fonts"

  $X11/bin/xset fp= "$fontpath"

echo "Using fontpath: $fontpath" >> /tmp/xinit.log
  unset fontpath
fi

# Start urxvt daemon
urxvtd -q -o -f

# Mute the bell
xset b off

exec $USERWM
