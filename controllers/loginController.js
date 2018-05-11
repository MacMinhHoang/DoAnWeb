var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('login/account_page');
});

module.exports = router;