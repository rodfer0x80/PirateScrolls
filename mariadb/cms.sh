#!/bin/bash
#Filename:cms.sh
#Description: Manage MariaDB (CRUD)
while [ 1 ]
do
  echo -e "\n\nDunims - Control Management System"
  echo "***********************************"
  echo "0) Quit Program"
  echo "1) Add paper"
  echo "2) Remove paper"
  echo "3) Update paper"
  echo "4) Display papers"
  read -p ">> " c
  if [ "$c" == 0 ];then
    echo "Gracefully quitting..."
    exit
  elif [ "$c" == 1 ];then
    echo "Add"
  elif [ "$c" == 2 ];then
    echo "Delete"
  elif [ "$c" == 3 ];then
    echo "Update"
  elif [ "$c" == 4 ];then
    ./display_db.sh
  else
    echo "Command not found."
  fi
done
