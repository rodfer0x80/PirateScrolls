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
});
module.exports = con;
