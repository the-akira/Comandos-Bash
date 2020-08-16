#!/bin/bash

# Definindo o array de arquivos
arquivos=( "/etc/passwd" "/etc/group" "/etc/hosts" )

# Extraindo o tamanho do array
tamanho_array=${#arquivos[@]}

# Extraindo cada elemento do array
elemento1=${arquivos[0]}
elemento2=${arquivos[1]}
elemento3=${arquivos[2]}

# Imprimindo elementos individualmente
echo $elemento1, $elemento2, $elemento3

# Percorrendo todos os elementos com for
for i in "${arquivos[@]}"
do
	echo $i
done

# Percorrendo todos os elementos com for
for (( i=0; i<$tamanho_array; i++))
do
	echo ${arquivos[${i}]}
done