var express = require('express');

var cartRepo = require('../repos/cartRepo');

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

router.post('/add', (req, res) => {
	cartRepo.isExisted(req.session.user.ID, req.query.id).then(rows => {
		if (rows.length > 0)
			cartRepo.update(req.session.user.ID, req.query.id, req.body.proQty).then(result => {
				res.redirect(req.headers.referer);
			});
		else	
	    	cartRepo.add(req.session.user.ID, req.query.id, req.body.proQty).then(result => {
				res.redirect(req.headers.referer);
			});
	});
});

module.exports = router;