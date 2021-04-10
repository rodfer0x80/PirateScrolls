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
  echo "6) Check database network configurations"
  echo "7) Dump database"
  echo "8) Load database"
  echo "9) Reset database"
  echo "10) Secure installation"
  read -p ">> " c
  [ "$c" == 0 ] && echo "Gracefully quitting..." && exit
  # Daemonise mysql server (start server on as &process)
  [ "$c" == 1 ] && sudo systemctl start mysql
  # Stop process
  [ "$c" == 2 ] && sudo systemctl stop mysql
  # Enable mysql on startup
  [ "$c" == 3 ] && sudo systemctl enable mysql
  # Disable mysql on startup
  [ "$c" == 4 ] && sudo systemctl disable mysql
  # Check mysql daemon status
  [ "$c" == 5 ] && sudo systemctl status mysql
  # Display mariadb networking related information
  [ "$c" == 6 ] && sudo netstat -ltpn | grep mariadb
  # Create sql dump  at /dump
  [ "$c" == 7 ] && ./dump_db.sh
  # Load sql dump to PirateScrolls table from /dump
  [ "$c" == 8 ] && ./load_db.sh
  # Reset auto_increment id and env var (for development)
  [ "$c" == 9 ] && ./reset_id.sh
    # Use mysql secure installation script to configure settings
  [ "$c" == 10 ] && sudo mysql_secure_installation
done
