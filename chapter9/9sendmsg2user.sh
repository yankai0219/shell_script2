#!/bin/bash

# Description: send a message to everybody's terminal

# 1. use wall
echo "test by me" | wall
wall "test by me"


# 2. use mesg
# mesg: control write access to your terminal

# SYNOPSIS: mesg [y|n]
