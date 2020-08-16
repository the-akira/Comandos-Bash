#!/bin/bash

echo -n "Informe uma opção (1, 2 ou 3): "
read num

case $num in
1)
echo "Opção 1 Selecionada";;
2)
echo "Opção 2 Selecionada";;
3)
echo "Opção 3 Selecionada";;
*)
echo "Opção inexistente";;
esac