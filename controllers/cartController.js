var express = require('express');

var cartRepo = require('../repos/cartRepo');

var restrict = require('../middle-wares/restrictUser');

var router = express.Router();

router.get('/', restrict, (req, res) => {
	cartRepo.loadAll(req.session.user.ID).then(rows => {
		var vm = {
			cart: rows
		}
	    res.render('cart/cart', vm);
	});
});

router.get('/checkout', restrict, (req, res) => {
    res.render('cart/checkout');
});

router.get('/order_success', restrict, (req, res) => {
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

router.post('/update', (req, res) => {
	cartRepo.update1(req.session.user.ID, req.query.id, req.body.proQty).then(result => {
		res.redirect(req.headers.referer);
	});
});

router.post('/remove', (req, res) => {
	cartRepo.remove(req.session.user.ID, req.query.id).then(result => {
		res.redirect(req.headers.referer);
	});
});

module.exports = router;