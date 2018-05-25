var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('register/register_page');
});

module.exports = router;