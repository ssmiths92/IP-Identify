#!/bin/bash

# Grabs the IP addresses from log.txt, sorts them and removes redundancy. Pastes results into a new file, linodeips1.txt.

cut -f 1 -d " " log.txt | sort | uniq > linodeips1.txt

# Runs whois on our IPs, then greps for and cats only the "NetName" field. 

cat linodeips1.txt | awk '{system("whois "$1)}' | grep NetName: > linodeips2.txt

# Grabs the second field of linodeips2.txt, which contains the NetName values, and pastes in linodeips3.txt.

cut -f 2 -d ":" linodeips2.txt > linodeips3.txt

# Merges the IP addresses and NetNames into one file, linodeips.txt.

paste -d' ' linodeips1.txt linodeips3.txt > linodeips.txt

# Removes unecessary files.

rm linodeips1.txt linodeips2.txt linodeips3.txt

# Cats the contents of linodeips.txt and greps for Linode IPs

cat linodeips.txt | grep 'LINODE-US'
