#!/bin/bash
# chapter: 8.5.2
# Program: learn how to use key-value 
# Date: 2014/02/10
declare -A list

key="a b c d a a b c e"
for i in $key
do
  echo $i
  let list[$i]++;
done

for t in "${!list[@]}"
do
  echo  $t:${list[$t]};
done
