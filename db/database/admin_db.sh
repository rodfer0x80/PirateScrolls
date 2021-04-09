#!/bin/bash
while [ 1 ]
do
  echo -e "\n\nPirateScrolls Admin"
  echo "********************"
  echo "0) Quit program"
  echo "1) Start database"
  echo "2) Stop database"
  echo "3) Enable database on reboot"
  echo "4) Disable database on reboot"
  echo "5) Check database status"
  echo "6) Check database port"
  echo "7) Dump database"
  echo "8) Load database"
  echo "9) Secure installation"
  read -p ">> " c
  if [ "$c" == 0 ];then
    echo "Gracefully quitting..."
    exit
  elif [ "$c" == 1 ];then
    sudo systemctl start mysql
  elif [ "$c" == 2 ];then
    sudo systemctl stop mysql
  elif [ "$c" == 3 ];then
    sudo systemctl enable mysql
  elif [ "$c" == 4 ];then
    sudo systemctl disable mysql
  elif [ "$c" == 5 ];then
    sudo systemctl status mysql
  elif [ "$c" == 6 ];then
    sudo netstat -ltpn | grep mariadb
  elif [ "$c" == 7 ];then
    ./dump_db.sh
  elif [ "$c" == 8 ];then
    ./load_db.sh
  elif [ "$c" == 9 ];then
    sudo mysql_secure_installation
  else
    echo "Command not found, quitting..."
  fi
done
