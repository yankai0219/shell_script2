#!/bin/bash
# File name: 3hash.sh
# Program: the use to declare a hash
# Date: 2014/1/30

declare hash
hash['a']=1
hash['b']=2
echo "hash['a']:${hash['a']}"
echo "hash['b']:${hash['b']}"
echo "hash['c']:${hash['c']}"

for item in "${!hash[@]}"
do
  echo key:$item
done
