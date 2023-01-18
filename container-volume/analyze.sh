#!/bin/bash

# 以下のようなcsvを作成する
# 数字部分はファジングの実行回数
# comp, partCFF, allCFF
# 123, 234, 134
# ...

function record () {
	name=''
	directory=$(find out -type d -name crashes)
	tmp=()
	for dir in $directory; do
		if [[ $name != $(echo $dir | cut -d'/' -f2) ]]; then
			name=$(echo $dir | cut -d'/' -f2)
		fi
		num=$(echo $dir | cut -d '/' -f 3 | cut -d '_' -f 2)
		for file in $dir/*; do
			if [[ "$file" =~ "execs" ]]; then
				tmp+=(${file//_/\/})
			fi
		done
	done
	# 回数に応じてソート
	sorted=$( printf "%s\n" "${tmp[@]}" | sort -t '/' -k 4 -n )
	header=$( printf "%s\n" "${tmp[@]}" | sort -t '/' -k 4 -n | cut -d '/' -f 2 | sort | uniq )
	headers=( $header )
	header=""
	for item in "${headers[@]}"; do
		header="$header,$item"
	done
	echo ${header#,} > $1
	# csvに出力
	execs=0
	num=''
	index=0
	header_length=${#headers[@]}
	for t in $sorted; do
		name=$(echo $t | cut -d '/' -f 2)
		execs=$(echo $t | cut -d '/' -f 7 | cut -d ',' -f 5 | cut -d ':' -f 2)
		num=$(echo $t | cut -d '/' -f 4)
		echo $num, $name, $execs
		if [[ $(( $index % $header_length )) == $(( $header_length - 1 )) ]]; then
			echo $execs >> $1
		else
			echo -n $execs, >> $1
		fi
		index=$(expr $index + 1)
	done
}

record "tmp.csv"
