var express = require ('express');
var router = express.Router();
router.get('/', function(req, rest, next){
    res.render(index);
});
module.exports = router;
