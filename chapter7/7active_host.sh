#!/bin/bash
host="61.135.169"
for host in $host.{1..255}
do
{
  echo $host
  ping $host -c 2  &> /dev/null
  if [ $? -eq 0 ]; then
    echo $host is active
  fi
}&
done
wait 
