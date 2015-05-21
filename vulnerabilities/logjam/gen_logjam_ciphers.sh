#!/bin/bash
vuln_ciphers="vuln_ciphers.txt"
openssl ciphers ALL:COMPLEMENTOFALL -v |grep "Kx=DH" | grep export | awk '{print $1}' > $vuln_ciphers
