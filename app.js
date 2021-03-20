const mysql = require("mysql");

// Create a connection object with the user details
const  con = mysql.createPool({
  connectionLimit: 1,
  host: "localhost",
  user: "dunims",
  password: "SecurePasswd!",
  database: "dunims",
  debug: false
});

// Query database
let sql ="SELECT * FROM users";

con.query(sql, (err, result) => {
  if (err) {
    console.error("Error executing query: " + JSON.stringify(err));
  } else {
      console.log(JSON.stringify(result));
  }
});

// Close connection when finished
con.end();
