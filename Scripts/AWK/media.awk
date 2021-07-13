{ energia = energia + $3 }

{ printf "%-13s %-13s %6s %6d\n", $1,$2,$3,energia }

END {
    print "-----------------------------------------"
    print "Total cavaleiros =", NR
    print "Energia total =", energia
    print "Energia média =", energia/NR
}