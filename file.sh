#! /bin/bash

mkdir ./a 
cd ./a

for i in {1..9}
do
	touch "test $i"
done
