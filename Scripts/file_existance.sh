#!/bin/bash

filename=$1
if [ -f "$filename" ]; then
	echo "Arquivo existe"
else
	echo "Arquivo não existe"
fi