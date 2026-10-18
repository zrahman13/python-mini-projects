#!/bin/bash
# Reports which .txt files in a folder are longer than 5 lines.
# Contains several bugs on purpose. Find and fix them.

dir=$1
cd $dir
for f in $(ls *.txt)
do
  if [ `wc -l < $f` -gt 5 ]
  then
    echo Long file: $f
  fi
done
rm -rf $dir/tmp/*
