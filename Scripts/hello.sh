echo "Hello World"

nome="Gabriel"
x=50
y=30

echo "Olá $nome"
echo $(($x + $y))
echo $(($x - $y))
echo $(($x / $y))
echo $(($x % $y))
echo $(($x * $y))

for((i = 0; i <= 20; i++)); do
  echo $i
done

for i in {5..50..5}; do
    echo "-> $i"
done

echo $(($RANDOM/1000))

if [[ -z "$nome" ]]; then
  echo "String is empty"
elif [[ -n "$nome" ]]; then
  echo "String is not empty"
else
  echo "This never happens"
fi