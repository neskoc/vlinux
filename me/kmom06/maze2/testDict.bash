#!/usr/bin/env bash
#

indexes=(0 1)
maps=(map0 map1)
declare -A dict

for ix in "${indexes[@]}"; do
	dict+=([$ix]=${maps[$ix]})
done

for key in "${!dict[@]}"; do
	echo "$key => ${dict[$key]}"
done

echo -e "${dict[1]}\\n"
