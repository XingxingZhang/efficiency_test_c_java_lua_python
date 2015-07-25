#!/bin/sh

echo "========test Lua========="
cd lua
source ~/.profile
echo "\n==test1=="
th test_sort.lua -infile ../rndints1.txt

echo "\n==test2=="
th test_sort.lua -infile ../rndints2.txt
echo "\n==test3=="
th test_sort.lua -infile ../rndints3.txt
cd ..
echo "========test Lua done=========\n\n\n"

