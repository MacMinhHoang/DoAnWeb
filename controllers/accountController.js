var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('account/index');
});

router.get('/orders_list', (req, res) => {
    res.render('account/orders');
});

router.get('/login', (req, res) => {
    res.render('account/login');
});

router.get('/register', (req, res) => {
    res.render('account/register');
});

module.exports = router;