#!/bin/bash
# chapter: 8.6
# Program: watch and compute the cpu usage in one hour
# Date: 2014/02/10

SECS=36
UNIT_TIME=6 # sample interval

STEPS=$((SECS / UNIT_TIME))

echo Watching CPU usage...;

for ((i=0; i < STEPS; i++))
do
  ps -eo comm,pcpu | tail -n +2 >> /tmp/cpu_usage.$$
  sleep $UNIT_TIME
done

echo 
echo CPU eaters:
cat /tmp/cpu_usage.$$ | \
awk '{process[$1] += $2} 
END{
  for (i in process)
  {
    printf("%-20s %s\n", i, process[i]);
  }
}' | sort -nrk 2 | head

#rm /tmp/cpu_usage.$$

