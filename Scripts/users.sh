#!/bin/bash

# Usuários logados no sistema
echo "Usuários atualmente logados: `who | wc -l`"
echo "Usuários atualmente logados: `who -q | sed -n '1p'`"
echo "Quantidade de usuários logados: `users | wc -w`"