#!/bin/bash

# Question: how to push git source to remote machine
remote_ip='xx.xx.xxx.xx'
remote_git='/tmp/aa.git'

# 1. create empty init repositories in local machine
git init

# 2. about $remote_git: 1) should be created 2) should be git init 
ssh $remote_ip "mkdir $remote_git; cd $remote_git; git init; git config --bool core.bare true"


# 3. manage set of tracked repositories
git remote add origin $remote_ip:$remote_git

# 4. add file
git add .

# 4. commit modification
git commit -m 'init'

# 5. git push
git push origin master

