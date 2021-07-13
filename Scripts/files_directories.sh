#!/bin/bash

# encontra o número de arquivos ou diretórios 
# presentes em um determinado diretório.
if [ -d "$@" ]; then
    echo "Arquivos encontrados: $(find "$@" -type f | wc -l)"
    echo "Diretórios encontrados: $(find "$@" -type d | wc -l)"
else
    echo "Erro. Informe outro diretório."
    exit 1
fi