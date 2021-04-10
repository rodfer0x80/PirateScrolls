#!/bin/bash

user="trevalkov"
pass="SecurePasswd!"
db="PirateScrolls"

q="ALTER TABLE papers AUTO_INCREMENT = 3;"
mysql --user=$user --password=$pass $db -e "$q"
echo 3 > ../database/.env
echo "[MESSAGE] id AUTO_INCREMENT successfully reset to 3"
echo "[MESSAGE] .env id reset to 3"
