STR="/arquivos/teste/main.cpp"
echo ${STR%.cpp}    # /arquivos/teste/main
echo ${STR%.cpp}.o  # /arquivos/teste/main.o
echo ${STR%/*}      # /arquivos/teste

echo ${STR##*.}     # cpp (extensão)
echo ${STR##*/}     # main.cpp (basepath)

echo ${STR#*/}      # arquivos/teste/main.cpp
echo ${STR##*/}     # main.cpp

echo ${STR/main/tests} # /arquivos/teste/tests.cpp

SRC="/arquivos/teste/main.cpp" # /arquivos/teste/main.cpp
BASE=${SRC##*/}   # main.cpp (basepath)
DIR=${SRC%$BASE}  # /arquivos/teste/ (dirpath)

echo $SRC $BASE $DIR