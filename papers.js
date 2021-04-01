var express = require ('express');
var router = express.Router();
var db = require('../database');
// more routes here
// script to fect data from mysql database table
router.get('/paper-list', function(req, rest, next){
  var sql = 'SELECT * FROM papers';
  db.query(sql, function(err, data, fields){
    if (err) throw err;
    res.render('paper-list', {title: 'Paper List', paperData: data});
  });
});
module.exports = router;
