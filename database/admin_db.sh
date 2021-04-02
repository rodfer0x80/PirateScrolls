#!/bin/bash
echo "0) Quit program"
echo "1) Start database"
echo "2) Stop database"
echo "3) Enable database on reboot"
echo "4) Disable database on reboot"
echo "5) Check database status"
echo "6) Check database port"
echo "7) Secure installation"
read -p ">> " c
if [ "$c" == 0 ];then
  echo "Gracefully quitting..."
  exit
elif [ "$c" == 1 ];then
  doas systemctl start mysql
elif [ "$c" == 2 ];then
  doas systemctl stop mysql
elif [ "$c" == 3 ];then
  doas systemctl enable mysql
elif [ "$c" == 4 ];then
  doas systemctl disable mysql
elif [ "$c" == 5 ];then
  doas systemctl status mysql
elif [ "$c" == 6 ];then
  doas netstat -ltpn | grep mariadb
elif [ "$c" == 7 ];then
  mysql_secure_installation
else
  echo "Command not found, quitting..."
fi
