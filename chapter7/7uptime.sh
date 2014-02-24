#!/bin/bash
# Chapter: 7.8
# Program: 

IPLIST="103.28.10.241 10.16.27.186"
for ip in $IPLIST
do
  time=$(ssh $ip "uptime" | awk '{print $3}')
  echo $ip--$time
done
