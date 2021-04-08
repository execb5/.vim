#! /usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

wal -n -i "$1"

COLORS=${HOME}"/.cache/wal/colors"
[[ ! -e $COLORS ]] && echo "ERR: Wal colors not found, exiting script. Did you executed Wal before?" && exit 0

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
