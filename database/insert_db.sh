#!/bin/bash

user="trevalkov"
pass="SecurePasswd!"
db="PirateScrolls"

while read line
do
  id=$line
done < .env

echo "Dunims - Insert Menu"
echo "0) Go back"
echo "1) Choose CSV file"
read -p ">> " c

if [ "$c" == 0 ];then
  echo "Going back..."
elif [ "$c" == 1 ];then
  echo "Enter name of the CVS file"
  echo "e.g. contributing/template.csv"
  read -p ">> " f
  echo "Enter name of the the PDF paper"
  echo "e.g. contributing/paper.pdf"
  read -p ">> " p
  #mv $p ../public/files
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
  done < <(tail -n +2 $f)

  q="INSERT INTO papers (title,year,author,organisation) VALUES
  ('$title',$year,'$author','$organisation');"
  mysql --user=$user --password=$pass $db -e "$q"

  mv $p ../public/files/paper$id.pdf
  id=$((id+1))
  echo $id > .env
else
  echo "Command not found."
fi
