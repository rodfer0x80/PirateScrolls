#!/bin/bash
while read line
do
  id=$line
done < dump/.env
id=$(($id - 1))
mysql -u trevalkov -pSecurePasswd! PirateScrolls < dump/PirateScrolls$id.sql
echo "Successfully loaded database dump!"
