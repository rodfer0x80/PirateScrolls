const express = require("express");
const app = express();
const mysql = require("mysql");
const bodyParser = require("body-parser");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}))
app.use(express.static("public"))
app.set("view engine", "ejs")
// Database
// Create a connection object with the user details
const  con = mysql.createPool({
  connectionLimit: 4,
  host: "localhost",
  user: "dunims",
  password: "SecurePasswd!",
  database: "dunims",
  debug: false
});

let users = []
// Return Users table when '/users' page is visited
function returnUsers(request, response){
  let sql ="SELECT * FROM users";
  con.query(sql, (err, result) => {
    if (err) {
      console.error("Error executing query: " + JSON.stringify(err));
    } else {
        users = JSON.stringify(result);
    }
  });
  let pathArray = request.url.split("/");
  let pathEnd = pathArray[pathArray.length - 1];
  if (pathEnd == 'users') {
    response.send(users);
  } else {

    response.send("{error: 'Path not found'}");
  }
}

// Add user to table when '/users' page is posted to
function addUser(request, response){
  let newUser = request.body.data;
  let sql = "INSERT INTO users(email) values('" + newUser + "');";
  con.query(sql, (err, result) => {
  if (err){
    console.error("Error executing query: " + JSON.stringify(err));
  } else {
    response.send("User added successfully.")
  }})
}

// Handle GET requests
// Root path
app.get("/", function(req, res){
  res.render("paddleshooter")
});
// users path
app.get("/users", returnUsers);

// Handle POST requests
// Root path
app.post("/users", addUser);
// Catch wrong paths
app.get("*", function(req, res){
  res.send("404 Page Not Found")
});
// Listen on port <port_number>
app.listen(8080, function(){
  console.log("Serving on port 8080...")
});
