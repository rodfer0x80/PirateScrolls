// http = require("http");
//const https = require("https");
const express = require('express');
const bodyParser = require("body-parser");
//var createError = require('http-errors');
//const fs = require('fs');
//const axios = require("axios");
var { exec } = require('child_process');
const path = require('path');
//var privateKey  = fs.readFileSync('/etc/letsencrypt/live/trevalkov.xyz/privkey.pem', 'utf8');
//var certificate = fs.readFileSync('/etc/letsencrypt/live/trevalkov.xyz/fullchain.pem', 'utf8');
//var credentials = {key: privateKey, cert: certificate};

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
//app.use(express.static("public"));

app.set('views', path.join(__dirname, 'views'));
app.set("view engine", "ejs");

app.use(express.json());
//app.use(express.urlencoded({ extended: false }));
//app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
// Database
// Create a connection object with the user details
var mysql = require('mysql');
var con = mysql.createConnection({
  host: "localhost",
  user: "dunims",
  password: "SecurePasswd!",
  database: "dunims",
});
con.connect(function(err) {
  if (err) throw err;
  console.log("MySQL is connected successfully");
})

//app.get("/", function(req, res){
//  res.render("index")
//});
app.get('/', function(req, res, next){
  var sql = 'SELECT * FROM papers';
  con.query(sql, function(err, data, fields){
    if (err) throw err;
    res.render('index', {title: 'Paper List', paperData: data});
  });
});
// users path
//app.get("/papers", indexRouter);
//app.post("/papers", addUser);
// catch wrong paths
app.get("*", function(req, res){
  res.send("404 Page Not Found")
});
//Listen on port <port_number>
//var httpServer = http.createServer(app);
app.listen(8080, function(){
  console.log("\nHTTP Serving on PORT 8080");
  exec('python3 greeting.py', (err,stdout,stderr) => {
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
