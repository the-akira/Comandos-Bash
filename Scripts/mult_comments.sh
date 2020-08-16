#!/bin/bash

: '
Script que calcula
recursivamente
o enésimo número 
da série Fibonacci

O número deve ser 
passado via parâmetro

Input / Output
1 -> 1
2 -> 1
3 -> 2
4 -> 3
5 -> 5
6 -> 8
20 -> 6.765
'
echo $1 | awk 'function fib(n) {
    return n<2 ? n : fib(n-1) + fib(n-2)
} {printf ("%'"'"'d\n", fib($1))}'