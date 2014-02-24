#!/bin/bash
# chapter: 8.5.2
# Program: find the top n command in bash_history
# Date: 2014/02/10

cat ~/.bash_history | awk '{list[$1]++} \
    END{
      for(i in list){
        printf("%s\t%d\n",i,list[i]);
      }
    }' | sort -nrk 2 | head
