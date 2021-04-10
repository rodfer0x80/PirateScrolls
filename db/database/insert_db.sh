#!/bin/bash

user="trevalkov"
pass="SecurePasswd!"
db="PirateScrolls"

# Read env var to number paper pdfs
while read line
do
  id=$line
done < .env

function loadPaper(){
  echo "Enter name of the CVS file"
  echo "e.g. page1"
  read -p ">> " f
  echo "Enter name of the the PDF paper"
  echo "e.g. paper1"
  read -p ">> " p
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
  done < <(tail -n +2 contributing/$f.csv)

  q="INSERT INTO papers (title,year,author,organisation) VALUES
  ('$title',$year,'$author','$organisation');"
  mysql --user=$user --password=$pass $db -e "$q"

  mv contributing/$p.pdf ../../app/public/files/paper$id.pdf
  id=$((id+1))
  echo $id > .env
}

echo "PirateScrolls - Insert Menu"
echo "0) Go back"
echo "1) Choose CSV file"
read -p ">> " c

[ "$c" == 0 ] && echo "Going back..."
[ "$c" == 1 ] && loadPaper;


