#!/bin/bash
# Program: 

# trap 'signal_handler_function_name'  SIGNAL LIST
function handler()
{
  echo Hey, recived signal : SIGINT
}

echo My Process ID is $$

trap 'handler' SIGINT

while true;
do
  sleep 1
done
