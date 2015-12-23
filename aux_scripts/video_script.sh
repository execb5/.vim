#!/bin/sh
#--------------------------------------------------------------------
#Purpose: To automate screen capture and webm conversion
#
#Author: Matthias Nunes
#
#Date/Time: 2015-12-23.04:55
#
#Modified date: --
#--------------------------------------------------------------------

version=0.0.1

show_help() {
cat << EOF
Usage: ${0##*/} [-h] [-w INPUT OUTPUT] [-c OUTPUT] [-a OUTMKV OUTWEBM]
Script to help when capturing the screen or converting videos to hd
webm.
Script uses ffmpeg to operate.

    -h                 display this help and exit.
    -w INPUT OUTPUT    converts INPUT to webm OUTPUT.
    -c OUTPUT          captures screen to OUTPUT.
    -a OUTMKV OUTWEBM  captures screen to OUTMKV and also outputs
                       webm OUTWEBM.
    -v                 displays version number and exit.
EOF
}

while :; do
	case $1 in
		-h|--help)
			show_help
			exit
			;;
		-v|--version)
			echo "${0##*/}"
			echo "Version: $version"
			exit
			;;
		-w|--webm)
			if [ -n "$2" -a -n "$3" ]; then
				webm_input=$2
				webm_output=$3
				shift 3
				continue
			else
				printf 'ERROR: "--webm" requires two non-empty options argument.\n' >&2
				exit 1
			fi
			;;
		-c|--capture)
			if [ -n "$2" ]; then
				capture_output=$2
				shift 2
				continue
			else
				printf 'ERROR: "--capture" requires a non-empty option argument.\n' >&2
				exit 1
			fi
			;;
		-a|--capture-and-convert)
			if [ -n "$2" -a -n "$3" ]; then
				cac_input=$2
				cac_output=$3
				shift 3
				continue
			else
				printf 'ERROR: "--webm" requires two non-empty options argument.\n' >&2
				exit 1
			fi
			;;
		--)
			shift
			break
			;;
		-?*)
			printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
			break
			;;
		*)
			break
	esac
done

if [ -n -z "$cac_input" -a -n -z "$cac_output" ]; then
	ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libx264 -qp 0 -preset ultrafast "$cac_input"
	ffmpeg -i "$cac_input" -vpre libvpx-720p -b 3900k -an -f webm -y "$cac_output"
	exit
fi

if [ -n -z "capture_output" ]; then
	ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libx264 -qp 0 -preset ultrafast "$capture_output"
	exit
fi

if [ -n -z "$webm_input" -n -a -z "$webm_output" ]; then
	ffmpeg -i "$webm_input" -vpre libvpx-720p -b 3900k -an -f webm -y "$webm_output"
	exit
fi

