#!/bin/bash

function Quadrado() {
	echo Função $FUNCNAME!
	echo -n "Informe um número -> "
	read x
	echo "$x² = $(( x**2 ))"
}

function Soma {
	(( x=$1+$2 )) 
	echo "$1 + $2 = $x"
}

Quadrado
soma=$(Soma 2 13)
echo $soma