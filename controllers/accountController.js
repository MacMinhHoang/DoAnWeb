var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('account/info');
});

router.get('/orders_list', (req, res) => {
    res.render('account/orders');
});

module.exports = router;