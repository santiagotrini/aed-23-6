#!/bin/bash

# colores
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# contador
tests_passed=0

# funciones
test_output() {
  output=$($1)
  expected=$2
  if [[ "$output" == "$expected" ]]
  then
    echo -e "[  ${GREEN}OK${NC}  ]: $1 → $2 ${GREEN}✓${NC}"
    tests_passed=$((tests_passed + 1))
  else
    echo -e "[ ${RED}Fail${NC} ]: Esperaba '$expected' pero se obtuvo '$output' ${RED}✗${NC}"
  fi
}

# 1_vectores
test_output "./1_vectores 1 1" "45.00"
test_output "./1_vectores 0 1" "90.00"
test_output "./1_vectores -1 0" "180.00"
test_output "./1_vectores 1 0" "0.00"
test_output "./1_vectores 0 -1" "270.00"

test_output "./1_vectores 3 3" "45.00"
test_output "./1_vectores -2 -2" "225.00"
test_output "./1_vectores 12 24" "63.43"
test_output "./1_vectores 0.1 -1" "275.71"
test_output "./1_vectores 1 -0.001" "359.94"

vectores_tests=$tests_passed
echo
# 2_random
test_output "./2_random 1 1 10" "4 7 8 6 4 6 7 3 10 2 3 8 1 10 4 7 1 7 3 7 "
test_output "./2_random 1 1 5" "4 2 3 1 4 1 2 3 5 2 3 3 1 5 4 2 1 2 3 2 "
test_output "./2_random 1 1 10" "4 7 8 6 4 6 7 3 10 2 3 8 1 10 4 7 1 7 3 7 "
test_output "./2_random 3 1 15" "7 11 4 1 1 11 13 2 2 5 14 5 4 5 8 7 10 11 2 1 "
test_output "./2_random 5 1 20" "16 6 11 13 17 13 1 10 14 2 7 9 1 19 11 1 1 7 9 7 "

test_output "./2_random 1 10" "te faltan argumentos"
test_output "./2_random 1" "te faltan argumentos"
test_output "./2_random 19 1 10" "10 7 9 3 8 6 2 6 3 5 8 1 6 7 10 6 7 10 4 9 "
test_output "./2_random 1 2 4" "3 3 2 3 4 3 3 2 2 3 4 3 4 3 4 3 2 2 3 3 "
test_output "./2_random 2 50 100" "62 54 82 88 77 74 89 98 69 59 93 65 83 52 76 98 82 50 50 82 "

test_output "./2_random 33 1 10" "4 6 9 8 10 1 2 4 5 5 9 1 3 8 1 8 4 9 3 7 "
test_output "./2_random 34 1 10" "9 9 5 7 9 10 7 1 8 5 6 9 5 5 10 9 6 9 2 5 "
test_output "./2_random 35 1 10" "5 4 8 9 8 10 7 2 6 3 8 10 7 4 3 5 1 2 9 6 "
test_output "./2_random 36 1 10" "7 1 8 9 2 4 10 1 6 1 5 8 3 1 4 5 3 2 3 10 "
test_output "./2_random 37 1 10" "10 6 6 2 3 10 4 6 5 3 1 10 2 5 8 1 9 10 3 5 "

random_tests=$(( $tests_passed - $vectores_tests ))
echo
# 3_euclides
test_output "./3_euclides 60 12" "12"
test_output "./3_euclides 16 40" "8"
test_output "./3_euclides 6 24" "6"
test_output "./3_euclides 3 18" "3"
test_output "./3_euclides 270 160" "10"

test_output "./3_euclides 14 42" "14"
test_output "./3_euclides 3 17" "1"
test_output "./3_euclides 1234 2468" "1234"
test_output "./3_euclides 27 90" "9"
test_output "./3_euclides 88 424" "8"

euclides_tests=$(( $tests_passed - $vectores_tests - $random_tests ))
echo
# 4_binario
test_output "./4_binario 19" "10011"
test_output "./4_binario 255" "11111111"
test_output "./4_binario 32" "100000"
test_output "./4_binario 5" "101"
test_output "./4_binario 2" "10"

test_output "./4_binario 128" "10000000"
test_output "./4_binario 99" "1100011"
test_output "./4_binario 42" "101010"
test_output "./4_binario 1234" "10011010010"
test_output "./4_binario 17" "10001"

test_output "./4_binario 12" "1100"
test_output "./4_binario 13" "1101"
test_output "./4_binario 24" "11000"
test_output "./4_binario 7" "111"
test_output "./4_binario 100" "1100100"


binario_tests=$(( $tests_passed - $euclides_tests - $vectores_tests - $random_tests ))
echo
# resultado final
echo "--------------  Resultado  --------------"
if [[ $tests_passed -eq 50 ]]
then
  echo -e "Todos los tests pasaron ${GREEN}✓${NC}"
  echo "Nota: " $(bc -l <<< "scale=2; (10/50) * $tests_passed")
else
  echo -e "1_vectores: $vectores_tests/10 ${GREEN}✓${NC}"
  echo -e "2_random: $random_tests/15 ${GREEN}✓${NC}"
  echo -e "3_euclides: $euclides_tests/10 ${GREEN}✓${NC}"
  echo -e "4_binario: $binario_tests/15 ${GREEN}✓${NC}"
  echo
  echo "Total: $tests_passed/50 tests OK."
  echo "Nota: " $(bc -l <<< "scale=2; (10/50) * $tests_passed")
fi

exit 0
