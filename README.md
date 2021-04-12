# PirateScrolls
Website for academic papers, only papers, no tracking, no web bloating, no ads.

 About this site

Born to provide online academic papers without ads, tracking or bloat web design.

    All respect is due to the authors of such academic papers and publications.
    All papers are in pdf format published online by the author(s)
    You can find the author and organisations involved in the paper in the table of contents and inside pdf the file.


Project

1. Motivation

To index the world OSINT

    This project is Open Source and is available at GitHub
    Developed by trevalkov

*********************************************************************************************************************************
2.Design
Design purpose: Simple page to serve online academic publications in pdf format.

app.js - main, connect to database and serve papers to the page
public - files :: pdf papers; stylesheets :: css sheet
views - ejs files (index, partials/header, partials/footer)
Db:
admin - papers_setup :: compress/decompress and setup papers to the correct folders; crud_db :: insert, delete, update and select from database menu (bash); admin_db :: admin database management controls
database - bash scripts manage and configure database

Dev:
admin - notes :: Linux commands, GNU utilities and database commands; tests :: frontend and backend tests, backend use run-test script to test or reset database

3. Implementation
Back-end features
Database automation.
Test and run database functionality with CLI bash scripts running shell and GNU utilities. 
Load pdf plus csv file with information as described in contributing/template with a simple bash script into the database with a few keystrokes.
Run-test tests database functionality with a bash script.
Compress and decompress pdf for portability using 7z.

Front-end interaction
Single page using EJS
Table of contents - papers in pdf format open in browser or download
About - about project
GitHub - link to the project

(javascript only to query database, run server and request data from database to the client)

-- Dependencies
:: Nodejs npm dependencies can be found at package.json
:: GNU tools for mysql/mariadb and unix shell functionality
