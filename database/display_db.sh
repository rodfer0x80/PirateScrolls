#!/bin/bash

user="trevalkov"
pass="SecurePasswd!"
db="PirateScrolls"
table="papers"

echo "PirateScrolls - Academic Papers"
q="SELECT * FROM papers"
mysql --user=$user --password=$pass $db -e "$q"
