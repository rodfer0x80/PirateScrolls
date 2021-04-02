#!/bin/bash

user="dunims"
pass="SecurePasswd!"
db="dunims"
table="papers"

q="SELECT * FROM papers"
mysql --user=$user --password=$pass $db -e "$q"
