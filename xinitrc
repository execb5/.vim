#! /bin/sh

CONNECTED_VGA=`xrandr | awk '/VGA/{ print $2 }'`

if [ "$CONNECTED_VGA" = "connected" ]
then
	VGA_NUMBER=`xrandr | awk '/VGA/{ print $1 }'`
	VGA_RESOLUTION=`xrandr | awk '/VGA/{ getline; print $1 }'`
	LVDS_NUMBER=`xrandr | awk '/LVDS/{ print $1 }'`
	xrandr --output $VGA_NUMBER --mode $VGA_RESOLUTION --output $LVDS_NUMBER --off
fi

feh --bg-scale ~/pictures/wallpapers/wallhaven-71029.png

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr

#xset +fp /usr/share/fonts/local
#xset fp rehash

sxhkd &
#panel &
exec bspwm

