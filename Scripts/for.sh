#!/bin/bash

for (( i=1; i<=13; i++ ))
do
	echo -n "$i "
done

printf "\n"

for i in $(ls)
do
	echo "$i"
done

for i in {0..20..4}
do 
    printf "$i\t"
done

printf "\n"