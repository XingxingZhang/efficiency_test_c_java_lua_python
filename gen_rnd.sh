#!/bin/sh

th randgen.lua -nrand 10000000 -seed 1 -minv 1 -maxv 10000000 -outfile rndints1.txt
th randgen.lua -nrand 10000000 -seed 2 -minv 1 -maxv 10000000 -outfile rndints2.txt
th randgen.lua -nrand 10000000 -seed 3 -minv 1 -maxv 10000000 -outfile rndints3.txt

