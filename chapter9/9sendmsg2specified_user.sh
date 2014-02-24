#!/bin/bash

USER=$1
devices=`ls /dev/pts/* -l | awk '{print $3,$10}' | grep $USER | awk '{print $2}'`
for dev in $devices
do
  cat /dev/stdin > $dev
done
