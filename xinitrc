#! /bin/sh

CONNECTED_VGA=`xrandr | awk '/VGA/{ print $2 }'`

if [ "$CONNECTED_VGA" = "connected" ]
then
	VGA_NUMBER=`xrandr | awk '/VGA/{ print $1 }'`
	VGA_RESOLUTION=`xrandr | awk '/VGA/{ getline; print $1 }'`
	LVDS_NUMBER=`xrandr | awk '/LVDS/{ print $1 }'`
	LVDS_RESOLUTION=`xrandr | awk '/LVDS/{ getline; print $1 }'` #will be useful if using two monitors
	xrandr --output $VGA_NUMBER --mode $VGA_RESOLUTION --output $LVDS_NUMBER --off
fi

feh --bg-scale ~/pictures/wallpapers/snow.jpg

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

#xset +fp /usr/share/fonts/local
#xset fp rehash

compton -b

sxhkd &
panel &
exec bspwm

