#!/bin/bash
host=$1
ciphers=$2
cipher_check="./cipher_check_url.sh"

if [ -n "$host" ] && [ -n "$ciphers" ] ; then 	
	if grep -q "error" <<< cat $ciphers | xargs -I -n1 vuln_ciph openssl s_client -connect $host:443 -cipher $vuln_ciph; then
		echo "$host is not vulnerable, you can continue sleeping... "
	else 
		echo "$host is VULNERABLE!"
	fi
else 
	echo "Error please e.g. start with ./cipher_check_url.sh www.strato.de  vuln_cipher.txt"
fi
