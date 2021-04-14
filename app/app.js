const express = require('express');
const bodyParser = require("body-parser");
const path = require('path');
const http = require('http');
const https = require('https');
const fs = require('fs');

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
  console.log("MySQL Database (MariaDB)");
})


app.get('/', function(req, res, next){
  let sql = 'SELECT * FROM papers';
  con.query(sql, function(err, data, fields){
    if (err) throw err;
    res.render('index', {title: 'Paper List', paperData: data});
  });
});

app.get('/about', function(req, res, next){
  res.render('about');
})

// Catch all wrong paths
app.get("*", function(req, res){
res.send("404 Page Not Found")
});

// Listen on port 8080 for HTTP requests
//app.listen(PORT, function(err){
//  if (err) throw err;
//  console.log("\nServer running at: http://localhost:${PORT}/");
//});
// Listen both http & https ports
const httpServer = http.createServer(app);
const httpsServer = https.createServer({
  key: fs.readFileSync('key.pem'),
  cert: fs.readFileSync('cert.pem'),
}, app);
httpServer.listen(80, () => {
    console.log('HTTP Server running on port 80');
});
httpsServer.listen(443, () => {
    console.log('HTTPS Server running on port 443');
});
