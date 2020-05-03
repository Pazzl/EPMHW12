#!/bin/bash

UNAME=$(whoami)

ls -RlA ~ | tee ./481.txt
echo "============================="
sed "s/${UNAME}/username/g" ./481.txt | tee ./482a.txt
echo "============================="
awk -v ptrn=$UNAME '{gsub(ptrn, "username")}1' ./481.txt | tee ./482b.txt
echo "============================="
awk '$0 !~ /total [[:digit:]]+/ {print}' ./481.txt | tee ./483.txt
echo "============================="
awk '$9 != "" {print $6" "$7"\t"$9}' ./481.txt | tee ./484.txt
echo "============================="
awk '$9 ~ /[0-9]/ {print $9}' ./481.txt | tee ./485.txt
echo "============================="
awk '$1 !~ /d/ && $9 ~ /^.+[.].*$/ {print $9}' ./481.txt | tee ./486.txt

