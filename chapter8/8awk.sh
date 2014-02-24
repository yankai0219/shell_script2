#!/bin/bash
# Reference: http://coolshell.cn/articles/9070.html
# Aim: only conclude the use of awk

# SYNTAX: awk [options] -f progfile [--] file ...

# 1. print the specify column
awk '{print $1,$4}' netstat.txt
awk '{printf("%-8s, %-8s", $1, $4)}' netstat.txt

# 2. filter the record
awk '$3==0 && $6=="LISTEN"' netstat.txt
awk '$3>0 && NR!=1{print $0}' netstat.txt


# 3. specify the FS (field specifier)
awk 'BEGIN{FS=":"} {print $1,$3}' OFS="\t" /etc/passwd

# 4. pattern match
awk '$6 ~ /EST/ || NR == 1 {print NR, $4, $5}' OFS="\t" netstat.txt
awk '$6 !~ /EST/ || NR == 1 {print NR, $4, $5}' OFS="\t" netstat.txt

# 5. split file 
awk 'NR!=1 {print > $6}' netstat.txt

# 6. statistics
ls -l | awk BEGIN{sum=0}{sum += }END{print sum}
ps aux | awk 'NR!=1{process[$1]+=$6}END{for(i in process){printf("i:%s,v:%s\n",i, process[i])}}'

history | awk '{tt[$2]++} END{for(i in tt){printf("%-20s %s\n",i, tt[i])}}' | sort -nrk 2| head
# 6. awk script



# The following is the content of netstat.txt
# Proto Recv-Q Send-Q Local Address               Foreign Address             State      
# tcp        0      0 pubt1v.ops.corp.qihoo.n:ssh 10.18.24.113:64211          LISTEN
# tcp      204      0 pubt1v.ops.corp.qihoo:58000 hn.kd.ny.adsl:wsmans        ESTABLISHED 
# tcp        0     52 pubt1v.ops.corp.qihoo.n:ssh 10.18.24.118:56610          ESTABLISHED 
# tcp        0      0 pubt1v.ops.corp.qihoo.n:ssh 10.18.24.113:61619          ESTABLISHED 
# tcp        0      0 pubt1v.ops.corp.qihoo.n:ssh 10.18.24.113:64181          ESTABLISHED 

# cat score.txt
# Marry   2143 78 84 77
# Jack    2321 66 78 45
# Tom     2122 48 77 71
# Mike    2537 87 97 95
# Bob     2415 40 57 62
