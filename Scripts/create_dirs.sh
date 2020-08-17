#!/bin/bash
echo -n "Informe o nome do dir: "
read newdir
cmd="mkdir $newdir"
eval $cmd