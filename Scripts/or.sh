#!/bin/bash

echo -n "Escolha um número: "
read n

if [[ ( $n -eq 13 || $n -eq 27 ) ]]
then
	echo "Número vencedor"
else
	echo "Número incorreto!"
fi