#! /usr/bin/env bash

# set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

[[ $# -lt 1 ]] && echo "pass wallpaper as parameter" && exit 1

LIGHT=${2:-}

if [[ -z $LIGHT ]]
then 
	wal -n -i "$1" 
else
	wal -n -l -i "$1"
fi

COLORS=${HOME}"/.cache/wal/colors"
[[ ! -e $COLORS ]] && echo "colors not found. Execute wal before" && exit 1

index=1
while read -r line
do
	regex='[0-9a-fA-F]{6}'
	if [[ $line =~ $regex ]]
	then
		eval "color$index=$line"
		index=$((index+1));
	fi
done < "$COLORS"

NEW_COLORS="# BEGIN_COLORS\n\
colors:\n\
  primary:\n\
    background: '$color1'\n\
    foreground: '$color8'\n\
  cursor:\n\
    text:       '$color1'\n\
    cursor:     '$color8'\n\
  normal:\n\
    black:      '$color1'\n\
    red:        '$color2'\n\
    green:      '$color3'\n\
    yellow:     '$color4'\n\
    blue:       '$color5'\n\
    magenta:    '$color6'\n\
    cyan:       '$color7'\n\
    white:      '$color8'\n\
  bright:\n\
    black:      '$color9'\n\
    red:        '$color10'\n\
    green:      '$color11'\n\
    yellow:     '$color12'\n\
    blue:       '$color13'\n\
    magenta:    '$color14'\n\
    cyan:       '$color15'\n\
    white:      '$color16'\n\
# END_COLORS"

gsed -i "/BEGIN_COLORS/,/END_COLORS/c$NEW_COLORS" ~/.alacritty.yml

NEW_COLORS="\t\t\t-- BEGIN_COLORS\n\
\t\t\tbackground = '$color1',\n\
\t\t\tforeground = '$color8',\n\
\t\t\tansi = {\n\
\t\t\t\t'$color1',\n\
\t\t\t\t'$color2',\n\
\t\t\t\t'$color3',\n\
\t\t\t\t'$color4',\n\
\t\t\t\t'$color5',\n\
\t\t\t\t'$color6',\n\
\t\t\t\t'$color7',\n\
\t\t\t\t'$color8',\n\
\t\t\t},\n\
\t\t\tbrights = {\n\
\t\t\t\t'$color9',\n\
\t\t\t\t'$color10',\n\
\t\t\t\t'$color11',\n\
\t\t\t\t'$color12',\n\
\t\t\t\t'$color13',\n\
\t\t\t\t'$color14',\n\
\t\t\t\t'$color15',\n\
\t\t\t\t'$color16',\n\
\t\t\t},\n\
\t\t\t-- END_COLORS"

gsed -i "/BEGIN_COLORS/,/END_COLORS/c\\$NEW_COLORS" ~/.wezterm.lua

automator -i "$1" ~/Documents/set_wallpaper.workflow
