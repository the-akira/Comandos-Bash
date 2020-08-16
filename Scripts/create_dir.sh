#!/bin/bash

echo -n "Informe o nome do diretório ->"
read dir

if [ -d "$dir" ]
then
	echo "Diretório já existente"
else
	`mkdir $dir`
	echo "Diretório criado com sucesso!"
fi