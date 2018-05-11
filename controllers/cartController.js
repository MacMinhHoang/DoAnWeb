var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('cart/cart');
});

router.get('/checkout', (req, res) => {
    res.render('cart/checkout');
});

router.get('/order_success', (req, res) => {
    res.render('cart/order_success');
});

module.exports = router;