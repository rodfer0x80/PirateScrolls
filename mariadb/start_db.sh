#!/bin/bash
echo "0) Quit program"
echo "1) Start database"
echo "2) Stop database"
read -p ">> " c
if [ "$c" == 0 ];then
  echo "Gracefully quitting..."
  exit
elif [ "$c" == 1 ];then
  doas systemctl start mysql
elif [ "$c" == 2 ];then
  doas systemctl stop mysql
else
  echo "Command not found, quitting..."
fi
