#!/bin/bash

user="dunims"
pass="SecurePasswd!"
db="dunims"

echo "Dunims - Delete Menu"
echo "0) Go back"
echo "1) Delete object by ID"
read -p ">> " c

if [ "$c" == 0 ];then
  echo "Going back..."
elif [ "$c" == 1 ];then
  echo "Enter ID to delete"
  read -p ">> " id
else
  echo "Command not found."
fi
#echo "$id"
q="DELETE FROM papers WHERE id = '$id'"
mysql --user=$user --password=$pass $db -e "$q"
