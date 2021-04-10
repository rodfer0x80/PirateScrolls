#!/bin/bash

sudo systemctl start mysql && echo "[SUCCESS] Database started"
sudo systemctl status mysql > db-status.log && echo "[SUCCESS] Database status"
# Database test logins
user="trevalkov"
pass="SecurePasswd!"
db="Test"

function loadPaper(){
  mkdir contributing
  cp ../../../db/database/contributing/page1.csv ./contributing/page1.csv
  while IFS="," read -r rec_column1 rec_column2 rec_column3 rec_column4
  do
    title="$rec_column1"
    year="$rec_column2"
    author="$rec_column3"
    organisation="$rec_column4"
  done < <(tail -n +2 contributing/page1.csv)

  q="INSERT INTO papers (title,year,author,organisation) VALUES
  ('$title',$year,'$author','$organisation');"
  mysql --user=$user --password=$pass $db -e "$q"
  cp ../../../app/public/files/paper1.pdf ./contributing/paper1.pdf
  mkdir files
  mv contributing/paper1.pdf files/paper$id.pdf
  id=$((id+1))
  echo $id > .env
}
# Read env var to number paper pdfs
echo 3 > .env
while read line
do
  id=$line
done < .env

# Test environment variable
[ -z $id ] || echo "1) 1/2 Environment variable working"

# Setup database
# Test load and connection
q="CREATE DATABASE IF NOT EXISTS Test;"
mysql --user=$user --password=$pass -e "$q" && echo "2) Connected to MySQL/MariaDB"
q="DROP TABLE IF EXISTS papers;"
mysql --user=$user --password=$pass $db -e "$q"
mkdir dump
cp ../../../db/database/dump/PirateScrolls1.sql dump/PirateScrolls1.sql
mysql --user=$user --password=$pass Test < dump/PirateScrolls1.sql && echo "3) Loaded dump file" && rm -f dump/PirateScrolls1.sql
# Test display, insert, delete and update
q="SELECT * FROM papers"
mysql --user=$user --password=$pass $db -e "$q" > pre-display.log
q="UPDATE papers SET title = 'Test5' WHERE id = 1;"
mysql --user=$user --password=$pass $db -e "$q" && echo "4) Updated papers"
q="DELETE FROM papers WHERE id = 3"
mysql --user=$user --password=$pass $db -e "$q" && echo "5) Deleted paper"
loadPaper && echo "6) Inserted paper"
q="SELECT * FROM papers"
mysql --user=$user --password=$pass $db -e "$q" > post-display.log && echo "7) Displayed papers to post-display.log"

# Dump and reset
# Read env var
echo 1 > dump/.env
while read line
do
  id=$line
done < dump/.env
[ -z $id ] || echo "8) 2/2 Environment variable working"

# Create numbered sql dump
mysqldump --user=$user --password=$pass -R Test > dump/Test$id.sql && echo "9) Dumped database"
[ -z dump/Test$id.sql ] && echo "[ERROR] Dumping database"
id=$((id+1))
echo $id > dump/.env

sudo systemctl stop mysql 2>/dev/null && echo "[SUCCESS] Database stopped"

diff pre-display.log post-display.log > diff.log
