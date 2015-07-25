#!/bin/sh

echo "========test Java========="
cd java
javac java_sort/TestSort.java 
echo "\n ==test1=="
java java_sort.TestSort ../rndints1.txt
echo "\n ==test2=="
java java_sort.TestSort ../rndints2.txt
echo "\n ==test3=="
java java_sort.TestSort ../rndints3.txt

cd ..
echo "========test Java done=========\n\n\n"

