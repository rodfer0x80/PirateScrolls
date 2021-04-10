#!/bin/bash

user="trevalkov"
pass="SecurePasswd!"
db="PirateScrolls"

echo "PirateScrolls - Delete Menu"
echo "0) Go back"
echo "1) Delete object by ID"
read -p ">> " c

[ "$c" == 0 ] && echo "Going back..."
[ "$c" == 1 ] && echo "Enter ID to delete" && read -p ">> " id

q="DELETE FROM papers WHERE id = '$id'"
mysql --user=$user --password=$pass $db -e "$q"
