var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('manufacturers/manufacturers');
});

module.exports = router;