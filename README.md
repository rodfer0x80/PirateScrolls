# PirateScrolls
Website for academic papers, only papers, no tracking, no web bloating, no ads.
 
 About this site

Born to provide online academic papers without ads, tracking or bloat web design.

    All respect is due to the authors of such academic papers and publications.
    All papers are in pdf format published online by the author(s)
    You can find the author and organisations involved in the paper in the table of contents and inside pdf file.


Project

To index the world OSINT

    This project is Open Source and is available at GitHub
    Developed by trevalkov

*********************************************************************************************************************************
-- Stack: (will expand the explanation soon)
:: Server side
Nodejs and npm
MariaDB/MySQL
GNU tools
Bash/Shell/ZShell
Python2 or Python3 (can also run without python so it is not required)
(javascript only to query database, run server and request data from database to the client)

-- Control
:: The control folder holds the scripts:
run -- starts server :: nodemon app.js
database_cms -- manage database :: CRUD CLI interface
admin_cms -- run database functions :: database commands in shell

-- Dependencies
:: Nodejs npm dependencies can be found at package.json.
:: GNU tools for mysql/mariadb and unix shell functionality
