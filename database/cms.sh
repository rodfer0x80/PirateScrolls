#!/bin/bash
#Filename:cms.sh
#Description: Manage MariaDB (CRUD)
while [ 1 ]
do
  echo -e "\n\nPirateScrolls - Control Management System"
  echo "***********************************"
  echo "0) Quit Program"
  echo "1) Insert paper"
  echo "2) Delete paper"
  echo "3) Update paper"
  echo "4) Display papers"
  read -p ">> " c
  if [ "$c" == 0 ];then
    echo "Gracefully quitting..."
    exit
  elif [ "$c" == 1 ];then
    echo -e "\n\n"
    ./insert_db.sh
  elif [ "$c" == 2 ];then
    echo -e "\n\n"
    ./delete_db.sh
  elif [ "$c" == 3 ];then
    echo -e "\n\n"
    ./update_db.sh
  elif [ "$c" == 4 ];then
    echo -e "\n\n"
    ./display_db.sh
  else
    echo "Command not found."
  fi
done
