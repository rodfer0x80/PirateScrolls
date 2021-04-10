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
  [ "$c" == 0 ] && echo "Gracefully quitting..." && exit
  # Insert paper into database using contributing folder with pdf and csv info
  [ "$c" == 1 ] && echo -e "\n\n" && ./insert_db.sh
  # Delete paper by ID
  [ "$c" == 2 ] && echo -e "\n\n" && ./delete_db.sh
  # Update information by ID
  [ "$c" == 3 ] && echo -e "\n\n" && ./update_db.sh
  # Print papers table
  [ "$c" == 4 ] && echo -e "\n\n" && ./display_db.sh
done
