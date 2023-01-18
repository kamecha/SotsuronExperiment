#!/bin/bash

testdir=$(pwd)/test
testfiles=$(find $testdir -type f -name "*.c")
number_of_attempts=100

function compile_and_fuzz () {
	for file in $testfiles; do
		trim="${file%*.c}"
		compiled="${trim}.out"
		trim="${trim##*/}"
		echo "compile $file"
		make compile CC_TARGET=$file CC_OUT=$compiled
		echo "fuzz $compiled"
		fuzz_out_dir=./out/$trim/$1
		mkdir -p $fuzz_out_dir
		make fuzz FUZZ_TARGET=$compiled FUZZ_OUTDIR=$fuzz_out_dir
		echo "remove $compiled"
		rm $compiled
	done
}

for num in $(seq 1 $number_of_attempts); do
	compile_and_fuzz "attempt_$num"
done
