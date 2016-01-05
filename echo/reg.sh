#!/bin/sh

#A bash function can't return a string directly like you want it to. You can do three things:
#
#echo a string
#return an exit status, which is a number, not a string
#share a variable
#Function only return int 

function strtolower()
{
    msg=$1
    new_msg=$(echo $msg | tr '[:upper:]' '[:lower:]')
    return 12 
}
strtolower Hello
ret=$?
echo $ret
