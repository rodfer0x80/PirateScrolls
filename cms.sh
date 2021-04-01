#!/bin/bash
mysql -u dunims -p
while [ 1 ]
do
  echo  "Dunims Control Management System"
  echo "*********************************"
  echo "0) Quit Program"
  echo "1) Add paper"
  echo "2) Remove paper"
  echo "3) Updatepaper"
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
  else
    echo "Command not found."
  fi
done
