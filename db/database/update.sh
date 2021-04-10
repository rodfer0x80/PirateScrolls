#!/bin/bash

user="trevalkov"
pass="SecurePasswd!"
db="PirateScrolls"

echo "PirateScrolls - Update Menu"
echo "0) Go back"
echo "1) Edit object by ID"
read -p ">> " c

if [ "$c" == 0 ];then
  echo "Going back..."
elif [ "$c" == 1 ];then
  echo "0) Go back"
  echo "1) Edit title"
  echo "2) Edit year"
  echo "3) Edit author(s)"
  echo "4) Edit organisation"
  read -p "$ " b
  if [ "$b" == 0 ];then
    echo "Going back..."
  elif [ "$b" == 1 ];then
    echo "Enter ID"
    read -p ">> " id
    echo "Enter replacement for previous title"
    read -p ">> " data
    q="UPDATE papers SET title = '$data' WHERE id = '$id';"
  elif [ "$b" == 2 ];then
    echo "Enter ID"
    read -p ">> " id
    echo "Enter replacement for previous release year"
    read -p ">> " data
    q="UPDATE papers SET year = '$data' WHERE id = '$id';"
  elif [ "$b" == 3 ];then
    echo "Enter ID"
    read -p ">> " id
    echo "Enter replacement for previous author(s)"
    read -p ">> " data
    q="UPDATE papers SET author = '$data' WHERE id = '$id'';"
  elif [ "$b" == 4 ];then
    echo "Enter ID"
    read -p ">> " id
    echo "Enter replacement for previous organisation name"
    read -p ">> " data
    q="UPDATE papers SET organisation = '$data' WHERE id = '$id';"
  else
    echo "Command not found."
  fi
else
  echo "Command not found."
fi


mysql --user=$user --password=$pass $db -e "$q"
