#!/bin/bash

# Recebe um diretório como argumento
# Altera a extensão dos arquivos para .py
for file in `ls $1/*`
do
	mv $file $file.py
done