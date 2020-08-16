#!/bin/bash

echo -n "Informe um número: "
read num

if [[ ( $num -ge 0 ) && ( $num%2 -eq 0 ) ]]
then
	echo "Número é par e positivo"
elif [[ (( $num -lt 0 )) ]]
then 
	echo "Número é negativo"
else
	echo "Número é ímpar"
fi