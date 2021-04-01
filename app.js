var http = require("http");
//const https = require("https");
var express = require('express');
//const bodyParser = require("body-parser");
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var createError = require('http-errors');
var path = require('path');
var indexRouter = require('./routes/index');
var papersRouter = require('./routes/papers');
//const fs = require('fs');
//const axios = require("axios");
var { exec } = require('child_process');

//var privateKey  = fs.readFileSync('/etc/letsencrypt/live/trevalkov.xyz/privkey.pem', 'utf8');
//var certificate = fs.readFileSync('/etc/letsencrypt/live/trevalkov.xyz/fullchain.pem', 'utf8');
//var credentials = {key: privateKey, cert: certificate};

var app = express();
//app.use(bodyParser.json());
//app.use(bodyParser.urlencoded({extended: true}));
//app.use(express.static("public"));
app.use('/', indexRouter());
app.use('/papers', papersRouter);

app.set('views', path.join(__dirname, 'views'));
app.set("view engine", "ejs");

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
//app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


// catch 404 and forward error handler
app.use(function(req,res,next){
  next(createError(404));
})
// error handler
app.use(function(err,req,res,next){
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') == 'development' ? err : {};
  // render error page
  res.status(err.status || 500);
  res.render('error');
})

module.exports = app;

//app.get("/", function(req, res){
//  res.render("index")
//});
// users path
//app.get("/papers", indexRouter);
//app.post("/papers", addUser);
// catch wrong paths
//app.get("*", function(req, res){
//  res.send("404 Page Not Found")
//});
//Listen on port <port_number>
//var httpServer = http.createServer(app);
app.listen(8080, function(){
  console.log("\nHTTP Serving on PORT 8080");
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
