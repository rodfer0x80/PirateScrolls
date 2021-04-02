#!/bin/bash

user="dunims"
pass="SecurePasswd!"
db="dunims"

while IFS="," read -r rec_column1 rec_column2 rec_column3 rec_column4
do
  echo "Title: $rec_column1"
  echo "Year: $rec_column2"
  echo "Author(s): $rec_column3"
  echo "Organisation: $rec_column4"
  echo -e "\nAdded data to database successfully."
  title="$rec_column1"
  year="$rec_column2"
  author="$rec_column3"
  organisation="$rec_column4"
done < <(tail -n +2 $1)

q="INSERT INTO papers (title,year,author,organisation) VALUES
('$title',$year,'$author','$organisation');"

mysql --user=$user --password=$pass $db -e "$q"
