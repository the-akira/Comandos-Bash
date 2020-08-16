#!/bin/bash

filename='files/editores.txt'
n=1
cat $filename | while read line || [[ -n $line ]]
do
	echo "Linha $n -> $line"
	n=$((n+1))
done