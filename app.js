const express = require('express');
const bodyParser = require("body-parser");
//Execute on becareful with user input as this can lead to RCE
const { exec } = require('child_process');
const path = require('path');

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

// View engine is EJS
// Stylesheets at ./public
// EJS files at ./views
app.set('views', path.join(__dirname, 'views'));
app.set("view engine", "ejs");
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Connect to database
var mysql = require('mysql');
var con = mysql.createConnection({
  host: "localhost",
  user: "trevalkov",
  password: "SecurePasswd!",
  database: "PirateScrolls",
});
con.connect(function(err) {
  if (err) throw err;
  console.log("MySQL Database");
})

app.get('/', function(req, res, next){
  var sql = 'SELECT * FROM papers';
  con.query(sql, function(err, data, fields){
    if (err) throw err;
    res.render('index', {title: 'Paper List', paperData: data});
  });
});

// Catch all wrong paths
app.get("*", function(req, res){
  res.send("404 Page Not Found")
});

// Listen on port 8080 for HTTP requests
app.listen(8080, function(){
  console.log("\nHTTP Server PORT 8080");
  exec('python3 ./dev/greeting.py', (err,stdout,stderr) => {
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
