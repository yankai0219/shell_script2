#!/bin/bash

this_file=`pwd`/$0
this_dir=`dirname $this_file`
. $this_dir/deploy.sh
uname=`uname`
##########################
#         help

if [ $# -lt 1 ] || [ "-h" == $1 ] || [ "--help" == $1 ]
then
  echo "Usage: $0 FILE1 [FILE2 ... ]";
  exit 0
fi


######################
#       Lets go

files=`ls $this_dir/../source`
echo files:$files
time=`date "+%Y%m%d%H%M%S"`
src_tgz="$HOME/patch.${time}.tgz"
tar zcvf $src_tgz -C $this_dir/../source $files > /dev/null 2>&1
echo $src_tgz
if [ ! -s $src_tgz ]; then
  echo "tar fail $c_error"
  exit 1
fi

###################
#      deploy

host="xxx.xxx.xxx.xxx"
online_dir="/tmp/deploy_test/source"
online_tgz="/tmp/patch_tgz.${time}.tgz"
echo ssh:$SSH host:$host
$SSH $host tar zcvf $online_tgz -C $online_dir $files > /dev/null 2>&1
$SCP $host:$online_tgz $online_tgz > /dev/null 2>&1

tar zxvf $online_tgz -C /tmp

for file in $files
do
  sleep 1
  diff_res=`diff $this_dir/../source/$file /tmp/$file`
  if [ -z "$diff_res" ]; then
    continue
  else 
    vimdiff $this_dir/../source/$file /tmp/$file
    
  fi
done

# upload original file to remote host
dst_src_tgz=`basename $src_tgz`
$SCP $src_tgz $host:"/tmp/$dst_src_tgz" > /dev/null 2>&1

$SSH $host "test -s /tmp/$dst_src_tgz"
if [ $? -ne 0 ]; then
  echo "Upload file Failure"
  exit 0
fi

# tar original file

$SSH $host "tar zxvf /tmp/${dst_src_tgz} -C $online_dir" 2>&1 | sed -e 's/^/    /'

if [ 0 != $? ]
then
  echo deloy failure
fi
