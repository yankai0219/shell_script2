#!/bin/bash
# Program:
#   <1> use ssh to implement autologin without password
# Description: 
#   1. local machine: generate private key [id_rsa] 
#      and public key [id_rsa.pub] and locate in .ssh
#   2. remote machine: the content of [id_rsa.pub] should be 
#      add to .ssh/authorized_keys 

# 1. create ssh secret key
ssh-keygen 

# 2. create .ssh/authorized_key with property 600 in remote machine
#    if the property is NOT 600, the verification will fail
ssh user@remote_ip "touch ~/.ssh/authorized_keys"
ssh user@remote_ip "chmod ~/.ssh/authorized_keys"

# 3. add [id_rsa.pub] to .ssh/authorized_keys
ssh user@remote_ip "cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_rsa.pub


# 4. test. No password is needed
ssh user@remote_ip uname

# <2> the use of ssh
# 1. change the port of ssh
ssh user@remote -p xxx

# 2. execute shell command
ssh user@remote "command1; command2"

# 3. the compress function
ssh -C
ssh -c blowfish # cipher specification for encrypting the session

# 4. redirect the stdout of local to the stdin of remote
#    the following two methods are both OKAY
ssh user@remote "cat >> remote" < local
cat local | ssh user@remoate "cat >> remote"
