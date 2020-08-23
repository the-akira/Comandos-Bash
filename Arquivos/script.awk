BEGIN {

Titulo="Os Cavaleiros do Zodíaco"

Coluna1="Nome"
Coluna2="Signo"
Coluna3="Energia"

printf "%s\n", Titulo
print "-----------------------------------"
printf "%-13s %-13s %s\n", Coluna1, Coluna2, Coluna3

}

{ printf "%-13s %-13s %6s\n", $1,$2,$3 | "sort -k3" }

END {

print "-----------------------------------"
print "Total de cavaleiros:", NR

}