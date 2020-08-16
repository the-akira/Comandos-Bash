#!/bin/bash

# O Bash fornece uma variável global RANDOM 
# que imprime um número aleatório entre 0 e 32.767 
# toda vez que o acessamos.
echo $RANDOM $RANDOM $RANDOM 

# número aleatório entre 0-10
echo $(($RANDOM % 11))