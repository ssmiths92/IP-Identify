#!/bin/bash

# Grab the IP address, sort them and remove redundancy. Paste results into a new file, linodeips1.txt.

cut -f 1 -d " " log.txt | sort | uniq > linodeips1.txt

# 

cat linodeips1.txt | awk '{system("whois "$1)}' | grep NetName: > linodeips2.txt

#

cut -f 2 -d ":" linodeips2.txt > linodeips3.txt

#

paste -d' ' linodeips1.txt linodeips3.txt > linodeips.txt

#

rm linodeips1.txt linodeips2.txt linodeips3.txt

#

cat linodeips.txt | grep 'LINODE-US'
