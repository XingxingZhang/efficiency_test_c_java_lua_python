#!/bin/sh

source ~/.profile
rm *.txt
./gen_rnd.sh
echo "generate random number done!\n\n\n"

./run_c++.sh

./run_java.sh

./run_lua.sh

./run_python.sh

