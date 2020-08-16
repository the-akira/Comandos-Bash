#!/bin/bash

COUNT=0
# bash until loop
until [ $COUNT -gt 5 ]; do
    echo Valor de COUNT é = $COUNT
    let COUNT++
done 