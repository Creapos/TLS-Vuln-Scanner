#!/bin/bash
servers="/home/server.csv"
hosts="servers.txt"
ciphers=$1 

if [ -n "$ciphers" ] ; then 
	cat $servers | sed 's/^\"//;s/\"//;' | awk '{print $1}' > $hosts
	cat $hosts | xargs -I host -P 20 -n1  ./cipher_check_url.sh host $ciphers
else
	echo "Please specify cipher list e.g. $cipher_check vuln_ciphers.txt"
fi
