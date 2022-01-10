#! /usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

for v in */
do
	cd "$v"
	IFS=" " read -a volumes <<< "${PWD##*/}"
	VOLUME="${volumes[4]}"
	for c in */
	do
		cd "$c"
		IFS="_" read -a chapters <<< "${PWD##*/}"
		#CHAPTER="${chapters[5]:2}"
		CHAPTER="${chapters[5]}"
		prefix="$VOLUME-$CHAPTER"
		for p in *
		do
			#echo "cp $p ../$prefix-$p"
			cp "$p" "../$prefix-$p"
		done
		cd ..
	done
	cd ..
done

