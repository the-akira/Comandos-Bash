#!/bin/bash

for arg in "$@"
do
index=$(echo $arg | cut -f1 -d=)
valor=$(echo $arg | cut -f2 -d=)
case $index in
X | x) x=$valor;;
Y | y) y=$valor;;
*)
esac
done
((z=x+y))
echo "$x+$y=$z"