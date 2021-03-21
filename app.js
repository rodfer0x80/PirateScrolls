const express = require("express");
const app = express();
const mysql = require("mysql");
const bodyParser = require("body-parser");
app.use(bodyParser.json());
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
let res = "USERS: ";
// Query database
let sql ="SELECT * FROM users";
  con.query(sql, (err, result) => {
  if (err) {
    console.error("Error executing query: " + JSON.stringify(err));
  } else {
    //res += "QUERYED SUCCESSFULLY";
  res += JSON.stringify(result);
  }
 });

// Return Users table when '/' page is visited
function returnUsers(request, response){
  response.send(res);
}

// Handle GET requests
// Root path
app.get("/", returnUsers);

// Handle POST requests
// Root path
app.post("/", (request, response) =>{
  let req = request.body;
  response.send("Received!\n");
});
// Listen on port <port_number>
app.listen(8080);
