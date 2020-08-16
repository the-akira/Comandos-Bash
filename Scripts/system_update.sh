#!/bin/bash

echo -e "\n$(date "+%d-%m-%Y --- %T") Iniciando Atualização\n"

apt update
apt upgrade

apt autoremove
apt autoclean

echo -e "\n$(date "+%T") Script finalizado"