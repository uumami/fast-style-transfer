#!/bin/bash
./setup.sh
prefix="style_photos/"
for filename in "style_photos"/* 
do
	file_no_ext="${filename%%.*}"
	file_no_ext=${file_no_ext#"$prefix"}
	echo "$file_no_ext"
	echo "$filename"
	python style.py \
	--style "$filename" \
  	--checkpoint-dir "/checkpoint" \
  	--test path "/test/inkling_test.jpeg" \
  	--test-dir "/test" \
  	--content-weight 1.5e1 \
  	--checkpoint-iterations 1000 \
  	--batch-size 20 \
	--train-path "$prefix"
done
