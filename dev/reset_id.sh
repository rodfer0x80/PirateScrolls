#!/bin/bash

user="dunims"
pass="SecurePasswd!"
db="dunims"

q="ALTER TABLE papers AUTO_INCREMENT = 1;"
mysql --user=$user --password=$pass $db -e "$q"
echo 1 > ../database/.env
echo "[MESSAGE] id AUTO_INCREMENT successfully reset to 1"
echo "[MESSAGE] .env id reset to 1"
