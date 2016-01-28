#! /bin/sh

CONNECTED_VGA=`xrandr | awk '/VGA/{ print $2 }'`
CONNECTED_HDMI=`xrandr | awk '/HDMI/{ print $2 }'`

if [ "$CONNECTED_VGA" = "connected" -a "$CONNECTED_HDMI" = "connected" ]
then
		VGA_NUMBER=`xrandr | awk '/VGA/{ print $1 }'`
		VGA_RESOLUTION=`xrandr | awk '/VGA/{ getline; print $1 }'`
		HDMI_NUMBER=`xrandr | awk '/HDMI/{ print $1 }'`
		HDMI_RESOLUTION=`xrandr | awk '/HDMI/{ getline; print $1 }'`
		LVDS_NUMBER=`xrandr | awk '/LVDS/{ print $1 }'`
		LVDS_RESOLUTION=`xrandr | awk '/LVDS/{ getline; print $1 }'` #will be useful if using two monitors
		xrandr --output $HDMI_NUMBER --mode $HDMI_RESOLUTION --output $VGA_NUMBER --mode $VGA_RESOLUTION --right-of $HDMI_NUMBER --output $LVDS_NUMBER --off
else
	if [ "$CONNECTED_VGA" = "connected" ]
	then
		VGA_NUMBER=`xrandr | awk '/VGA/{ print $1 }'`
		VGA_RESOLUTION=`xrandr | awk '/VGA/{ getline; print $1 }'`
		LVDS_NUMBER=`xrandr | awk '/LVDS/{ print $1 }'`
		LVDS_RESOLUTION=`xrandr | awk '/LVDS/{ getline; print $1 }'` #will be useful if using two monitors
		xrandr --output $VGA_NUMBER --mode $VGA_RESOLUTION --output $LVDS_NUMBER --off
	else
		if [ "$CONNECTED_HDMI" = "connected" ]
		then
			HDMI_NUMBER=`xrandr | awk '/HDMI/{ print $1 }'`
			HDMI_RESOLUTION=`xrandr | awk '/HDMI/{ getline; print $1 }'`
			LVDS_NUMBER=`xrandr | awk '/LVDS/{ print $1 }'`
			LVDS_RESOLUTION=`xrandr | awk '/LVDS/{ getline; print $1 }'` #will be useful if using two monitors
			xrandr --output $HDMI_NUMBER --mode $HDMI_RESOLUTION --output $LVDS_NUMBER --off
		fi
	fi
fi

feh --bg-fill ~/pictures/wallpapers/fsn02.jpg

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

compton -b

sxhkd &
panel &
exec bspwm

