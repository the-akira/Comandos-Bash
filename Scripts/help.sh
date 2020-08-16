#!/bin/bash

for arg in "$@"
do
    if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]
    then
        echo "Argumento help ativado!"
    fi
done