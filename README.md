# PirateScrolls
Web application for academic papers, only papers, no tracking, no web bloating, no ads, decentralized hosting.

 About this site

Born to provide online academic papers without ads, tracking or bloat web design.

    Copyright of distributed papers belong to the authors of such publications.
    All papers are in pdf format published online by the author(s)
    You can find the author and organisations involved in the paper in the table of contents and inside pdf the file.


Project

1. Motivation

To index the world OSINT

    This project is Open Source and is available at GitHub
    Developed by trevalkov

2. Project Description

For this project I decided to build a web server for educational content. 
This website was designed with a minimalistic approach thus avoiding web
bloating rendering the using EJS to respect the REST framework To serve
its purpose it doesn’t require tracking or ads either, making the application 
itself not too hard to develop, I have tried to think about some extra features
I could add as an Express middleware but it didn’t seem necessary, after noticing
that I decided to invest some more time into the backend and database. Simply
rendering the page with the papers and database data selected from the main table
on both http and https on ports 80 and 443 with a self signed certificate 
(I have tested it on a VPS with a Let’sEncrypt certificate as shown in the last screenshot).
Under db/database there is a CRUD app to control the database and simply add new papers with
their respective data (title, year, author, organisation) with just a simple keystrokes after
moving the pdf paper to the ‘contributing’ folder and creating the CSV with the data inside 
the same folder. An admin control script to easily manage the database in most Linux distros
and automated database testing with another script as well. db/admin holds the admin and crud
script as well as a script to compress and decompress and setup the papers to serve on the 
website as pdf files can become heavy. There is a dump backup available at 
db/database/dump/PirateScrolls1.sql with just the template values I used in the screenshot.
To quickly start the server start MySQL, create database PirateScrolls, load dump into PirateScrolls,
go to dev/notes and use the ssl.sh to get self signed certificates, then go to dev/tests/backend and 
run the run-test script to test the database. Then go to app and with root permissions run
‘node app.js’ to be able to start the server on ports 80 and 443.
