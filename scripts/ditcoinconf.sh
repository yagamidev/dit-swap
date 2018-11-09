#!/bin/bash -ev

mkdir -p ~/.ditcoin
echo "rpcuser=username" >>~/.ditcoin/ditcoin.conf
echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >>~/.ditcoin/ditcoin.conf

