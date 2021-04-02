#!/bin/bash
while read line
do
  id=$line
done < dump/.env

mysqldump -u trevalkov -pSecurePasswd! -R PirateScrolls > dump/PirateScrolls$id.sql
echo "Successfully dump database to /dump"
id=$((id+1))
echo $id > dump/.env
