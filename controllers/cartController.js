var express = require('express');

var cartRepo = require('../repos/cartRepo'),
	accountRepo = require('../repos/accountRepo'),
	orderRepo = require('../repos/orderRepo'),
	productRepo = require('../repos/productRepo');

var restrict = require('../middle-wares/restrictUser');

var router = express.Router();

router.get('/', restrict, (req, res) => {
	cartRepo.count(req.session.user.ID).then(result => {
		if (result[0].SoLuong === 0)
		{
			var vm = {
				isEmpty: true,
				showError: false
			};
	    	res.render('cart/cart', vm);
		}
		else
		{
			cartRepo.loadAll(req.session.user.ID).then(rows => {
				var vm = {
					cart: rows,
					isEmpty: false
				};
			    res.render('cart/cart', vm);
			});
		}
	});
});

router.get('/order_success', restrict, (req, res) => {
    res.render('cart/order_success');
});

router.post('/add', (req, res) => {
	if (req.session.user == null)
		res.redirect('/account/login');
	else
	{
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
		if (req.body.viewCart == 1)
			res.redirect('/cart');
	}	
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

router.get('/checkout', restrict, (req, res) => {
	cartRepo.count(req.session.user.ID).then(result => {
		if (result[0].SoLuong === 0)
		{
			var vm = {
				isEmpty: true,
				showError: true
			};
		    res.render('cart/cart', vm);
		}
		else
		{
			var p1 = accountRepo.single(req.session.user.ID),
				p2 = cartRepo.calculateTotal(req.session.user.ID),
				p3 = cartRepo.loadAll(req.session.user.ID);

			Promise.all([p1, p2, p3]).then(([a, b, c]) => {
		        var vm = {
		            customer: a,
		            order: b,
		            products: c
		        };
		        res.render('cart/checkout', vm);
		    });	
		}
	});
});

router.post('/checkout', (req, res) => {
	orderRepo.add(req.body);
	orderRepo.singleNewlyAdded().then(rows => {
		var orderID = rows[0].ID;
		orderRepo.addOrderProducts(req.session.user.ID, orderID);
		cartRepo.loadAll(req.session.user.ID).then(pros => {
			for (i = 0; i < pros.length; i++)
			{
				productRepo.updateAfterBought(pros[i].ID, pros[i].SoLuong);
			}
		});
		cartRepo.delete(req.session.user.ID);
		var vm = {
			user: req.session.user.HoTen,
			order: orderID
		}
		res.render('cart/order_success', vm);
	});
});

module.exports = router;