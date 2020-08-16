#!/bin/bash
string="Coluna1 Coluna2 Coluna3"
substring=$(echo $string | cut -d ' ' -f 1-3)
echo $substring