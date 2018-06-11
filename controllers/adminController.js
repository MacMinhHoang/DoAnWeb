var express = require('express');

var manuRepo = require('../repos/manufacturerRepo'),
	categoryRepo = require('../repos/categoryRepo'),
	orderRepo = require('../repos/orderRepo'),
	productRepo = require('../repos/productRepo');

var router = express.Router();


router.get('/', (req, res) => {
	var vm = {
		layout: 'admin.handlebars'
	};
    res.render('admin/index', vm);
});

router.get('/categories', (req, res) => {

	categoryRepo.loadAll().then(rows => {
		var vm = {
			layout: 'admin.handlebars',
			cats: rows
		};
	    res.render('admin/categories', vm);
	});
});

router.post('/categories/remove', (req, res) => {
    categoryRepo.remove(req.body.CatId);
    res.redirect('/admin/categories');
});

router.get('/categories/edit', (req, res) => {

	categoryRepo.single(req.query.id).then(c => {
		var vm = {
			layout: 'admin.handlebars',
			Category: c
		};
	    res.render('admin/catEdit', vm);
	});
});

router.post('/categories/edit', (req, res) => {
    categoryRepo.update(req.body).then(value => {
        res.redirect('/admin/categories');
    });
});

router.get('/categories/add', (req, res) => {
	var vm = {
		layout: 'admin.handlebars',
	};
    res.render('admin/catAdd', vm);
});

router.post('/categories/add', (req, res) => {
    categoryRepo.add(req.body).then(value => {
        res.redirect('/admin/categories');
    });
});

router.get('/orders', (req, res) => {

	orderRepo.loadAll().then(rows => {
		var vm = {
			layout: 'admin.handlebars',
			orders: rows
		};
	    res.render('admin/orders', vm);
	});
});

router.get('/orders/edit', (req, res) => {

	orderRepo.single(req.query.id).then(c => {
		var vm = {
			layout: 'admin.handlebars',
			Order: c
		};
	    res.render('admin/orderEdit', vm);
	});
});

router.post('/orders/edit', (req, res) => {
    orderRepo.update(req.body).then(value => {
        res.redirect('/admin/orders');
    });
});


router.get('/products', (req, res) => {

	productRepo.loadAll().then(rows => {
		var vm = {
			layout: 'admin.handlebars',
			products: rows
		};
	    res.render('admin/products', vm);
	});
});

router.post('/products/remove', (req, res) => {
    productRepo.remove(req.body.ProId);
    res.redirect(req.headers.referer);
});

router.get('/products/edit', (req, res) => {
	var p1 = productRepo.single(req.query.id),
		p2 = categoryRepo.loadAll(),
		p3 = manuRepo.loadAll();
	 Promise.all([p1, p2, p3]).then(([c, pRows1, pRows2]) => {
		var vm = {
			layout: 'admin.handlebars',
			Product: c,
			Categories: pRows1,
			Suppliers: pRows2
		};
	    res.render('admin/proEdit', vm);
	});
});

router.post('/products/edit', (req, res) => {
    productRepo.update(req.body).then(value => {
        res.redirect('/admin/products');
    });
});

router.get('/products/add', (req, res) => {
	var p1 = categoryRepo.loadAll(),
		p2 = manuRepo.loadAll();
	 Promise.all([p1, p2]).then(([pRows1, pRows2]) => {
		var vm = {
			layout: 'admin.handlebars',
			Categories: pRows1,
			Suppliers: pRows2
		};
	    res.render('admin/proAdd', vm);
	});
});

router.post('/products/add', (req, res) => {
    productRepo.add(req.body).then(value => {
        res.redirect('/admin/products');
    });
});

router.get('/suppliers', (req, res) => {

	manuRepo.loadAll().then(rows => {
		var vm = {
			layout: 'admin.handlebars',
			suppliers: rows
		};
	    res.render('admin/suppliers', vm);
	});
});

router.post('/suppliers/remove', (req, res) => {
    manuRepo.remove(req.body.NSXId);
    res.redirect('/admin/suppliers');
});

router.get('/suppliers/edit', (req, res) => {

	manuRepo.single(req.query.id).then(c => {
		var vm = {
			layout: 'admin.handlebars',
			Supplier: c
		};
	    res.render('admin/supEdit', vm);
	});
});

router.post('/suppliers/edit', (req, res) => {
    manuRepo.update(req.body).then(value => {
        res.redirect('/admin/suppliers');
    });
});

router.get('/suppliers/add', (req, res) => {
	var vm = {
		layout: 'admin.handlebars',
	};
    res.render('admin/supAdd', vm);
});

router.post('/suppliers/add', (req, res) => {
    manuRepo.add(req.body).then(value => {
        res.redirect('/admin/suppliers');
    });
});

module.exports = router;