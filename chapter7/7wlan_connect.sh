#!/bin/bash
# File name: 7wlan_connect.sh

############# Parameter ##############

IFACE=wlan0
IP_ADDR=192.168.1.5
SUBNET_MASK=255.255.255.0
GW=192.168.1.1
HW_ADDR='AA:00:00:C5:D4:47'

ESSID='homenet'
WEP_KEY=8b1402
FREQ=2.462G

######################################
KEY_PART=""

if [[ -n $WEP_KEY ]]; then
  KEY_PART="key $WEP_KEY"
fi

# close interface before new configuration
/sbin/ifconfig $IFACE down

if [ $UID -ne 0 ]; then
  echo "Run as root"
  exit 1
fi

if [[ -n $HW_ADDR ]]; then
  /sbin/ifconfig hw ether $HW_ADDR
  echo Spoofed MAC ADDRESS to $HW_ADDR
fi

/sbin/iwconfig $IFACE essid $ESSID $KEY_PART freq $FREQ

/sbin/ifconfig $IFACE $IP_ADDR netmask $SUBNET_MASK

route add default gw $GW $IFACE

echo Successfully configured $IFACE
