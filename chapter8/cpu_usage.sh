#!/bin/bash

SECS=36
UNIT_TIME=6
STEPS=$(($SECS/$UNIT_TIME));
#echo $STEPS

for((i=0; i < $STEPS; i++))
do
  ps -eo comm,pcpu | tail -n +2 > /tmp/my.$$
  sleep $UNIT_TIME
done

cat /tmp/my.$$ | \
awk '{process[$1] += $2}
  END{
    for(i in process)
    {
      printf("%-20s %s\n", i, process[i]);
    }
  }' | sort -nrk 2 | head


