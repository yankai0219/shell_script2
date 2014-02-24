#!/bin/bash

# Program: 
#     1. Install tokyotyrant
#     2. Compile this tokyotyrant plugin
#     3. make install to specified directory
# Date: 2014/1/23 By yk

# Wget the source code
tyrant_ver="1.1.41"
cabinet_ver="1.4.48"

tokyotyrant_tgz="tokyotyrant-${tyrant_ver}.tar.gz"
tokyotyrant="tokyotyrant-${tyrant_ver}"

tokyocabinet_tgz="tokyocabinet-${cabinet_ver}.tar.gz"
tokyocabinet="tokyocabinet-${cabinet_ver}"


#install tokyotyrant
wget http://fallabs.com/tokyocabinet/tokyocabinet-${cabinet_ver}.tar.gz
if ["$?" != "0"]; then
    echo "wget tokeyocabinet-${cabinet_ver}.tar.gz ERROR"
    exit -1
fi

tar zxvf $tokyocabinet_tgz
cd $tokyocabinet
./configure
make
sudo make install

#install tokyocabinet
cd ..
wget http://fallabs.com/tokyotyrant/tokyotyrant-${tyrant_ver}.tar.gz
if ["$?" != "0"]; then
    echo "wget tokeyotyrant-${tyrant_ver}.tar.gz ERROR"
    exit -1
fi

tar zxvf $tokyotyrant_tgz 
cd $tokyotyrant
./configure
make
sudo make install

cd ..
sudo rm -rf tokyo*
echo "rm is executed"

#compile tokyotyrant plugin
make
sudo make install
