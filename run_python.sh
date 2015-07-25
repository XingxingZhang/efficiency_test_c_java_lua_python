#!/bin/sh

echo "========test Python========="
cd python
echo "\n==test1=="
python test_sort.py ../rndints1.txt

echo "\n==test2=="
python test_sort.py ../rndints2.txt
echo "\n==test3=="
python test_sort.py ../rndints3.txt
cd ..
echo "========test Python done=========\n\n\n"

