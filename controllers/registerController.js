var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('register/register_page');
});

router.get('/captcha_form', (req, res) => {
    res.render('register/captcha_form');
});

module.exports = router;