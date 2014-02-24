#!/bin/bash

# Description: the use of ifconfig
# ifconfig - configure a network interface

# 1. print the network interface

ifconfig | cut -c-10 | tr -d ' ' | tr -s '\n'

# 2. print the ip address from ifconfig
#    method1:
ifconfig eth0 | grep 'inet addr' | awk '{print $2}' | cut -d ':' -f2


# 3. hardware address defraud 
ifconfig hw ether AA:00:00:C5:D4:47

# 4. read the local name server from /etc/resolv.conf
cat /etc/resolv.conf

# 5. DNS search
host google.com

host google.com | grep 'has address' | awk '{print $4}'


# 6. route: show / manipulate the IP routing table

route

route -n 

route add default gw IP_ADDRESS INTERFACE_NAME
