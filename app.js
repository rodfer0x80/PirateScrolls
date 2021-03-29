const http = require("http");
const https = require("https");
const express = require("express");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const fs = require('fs');
const axios = require("axios");
const { exec } = require('child_process');

//var privateKey  = fs.readFileSync('/etc/letsencrypt/live/trevalkov.xyz/privkey.pem', 'utf8');
//var certificate = fs.readFileSync('/etc/letsencrypt/live/trevalkov.xyz/fullchain.pem', 'utf8');
//var credentials = {key: privateKey, cert: certificate};

var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));
app.set("view engine", "ejs");
// Database
// Create a connection object with the user details
const  con = mysql.createPool({
  connectionLimit: 1,
  host: "localhost",
  user: "dunims",
  password: "SecurePasswd!",
  database: "dunims",
  debug: false
});

let papers = "";
// Return Users table when '/papers' page is visited
function returnUsers(request, response){
  let sql ="SELECT * FROM papers";
  con.query(sql, (err, result) => {
    if (err) {
      console.error("Error executing query: " + JSON.stringify(err));
    } else {
        papers = JSON.stringify(result);
    }
  });
  let pathArray = request.url.split("/");
  let pathEnd = pathArray[pathArray.length - 1];
  if (pathEnd == 'papers') {
    response.send(papers);
  } else {

    response.send("{error: 'Path not found'}");
  }
}

// Add user to table when '/users' page is posted to
function addUser(request, response){
  let newUser = request.body.data;
  let sql = "INSERT INTO papers (title,year,author,organisation) VALUES ('Unified Field Theory',2021,'trevalkov', 'MIT');"
  //"INSERT INTO users(email) values('" + newUser + "');";
  con.query(sql, (err, result) => {
  if (err){
    console.error("Error executing query: " + JSON.stringify(err));
  } else {
    response.send("Paper added successfully.")
  }})
}

// Handle GET requests
// Root path
app.get("/", function(req, res){
  res.render("paddleshooter")
});
// users path
app.get("/papers", returnUsers);

// Handle POST requests
// Root path
app.post("/papers", addUser);
// Catch wrong paths
app.get("*", function(req, res){
  res.send("404 Page Not Found")
});
//Listen on port <port_number>
var httpServer = http.createServer(app);
httpServer.listen(8080, function(){
  console.log("\nHTTP Serving on PORT 8080");
  console.log("MYSQL Database Connected");
  exec('python3 dev/greeting.py', (err,stdout,stderr) => {
    if (err){
      return 0;
    }
    console.log(`${stdout}`);
  });
});
//var httpsServer = https.createServer(app);
//httpsServer.listen(433, function(){
//  console.log("HTTPS serving on port 433...")
//})
