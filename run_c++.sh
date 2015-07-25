#!/bin/sh

echo "========test C++========="
cd c++
make clean && make
echo "\n==test1=="
./test_sort ../rndints1.txt
echo "\n==test2=="
./test_sort ../rndints2.txt
echo "\n==test3=="
./test_sort ../rndints3.txt
cd ..
echo "========test C++ done=========\n\n\n"

