#!/bin/bash
soma=0
for (( i=1; i<=36; i++ ))
do
	(( soma+=i ))
	echo -n "$i "
done
printf "\n"
echo "Total = $soma"