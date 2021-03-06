var express = require('express');

var manuRepo = require('../repos/manufacturerRepo'),
	categoryRepo = require('../repos/categoryRepo'),
	orderRepo = require('../repos/orderRepo'),
	productRepo = require('../repos/productRepo');

var restrict = require('../middle-wares/restrictAdmin');

var router = express.Router();

router.post('/logout', (req, res) => {
    req.session.isLogged = false;
    req.session.admin = null;
    res.redirect('/');
});

router.get('/', restrict, (req, res) => {
	var vm = {
		layout: 'admin.handlebars'
	};
    res.render('admin/index', vm);
});

router.get('/categories', restrict, (req, res) => {

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

router.get('/categories/edit', restrict, (req, res) => {

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
        var vm = {
			layout: 'admin.handlebars',
			isUpdate: true
		};
	    res.render('admin/catEdit', vm);
    });
});

router.get('/categories/add', restrict, (req, res) => {
	var vm = {
		layout: 'admin.handlebars'
	};
    res.render('admin/catAdd', vm);
});

router.post('/categories/add', (req, res) => {
    categoryRepo.add(req.body).then(value => {
        var vm = {
			layout: 'admin.handlebars',
			isUpdate: true
		};
	    res.render('admin/catAdd', vm);
    });
});

router.get('/orders', restrict, (req, res) => {

	orderRepo.loadAll().then(rows => {
		var vm = {
			layout: 'admin.handlebars',
			orders: rows
		};
	    res.render('admin/orders', vm);
	});
});

router.get('/orders/edit', restrict, (req, res) => {

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


router.get('/products', restrict, (req, res) => {

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

router.get('/products/edit', restrict, (req, res) => {
	var p1 = productRepo.single(req.query.id),
		p2 = categoryRepo.loadAll(),
		p3 = manuRepo.loadAll(),
		p4 = categoryRepo.singleProID(req.query.id),
		p5 = manuRepo.singleProID(req.query.id);
	 Promise.all([p1, p2, p3, p4, p5]).then(([p, pRows1, pRows2, cat, manu]) => {
		var vm = {
			layout: 'admin.handlebars',
			Product: p,
			Categories: pRows1,
			Suppliers: pRows2,
			ProCat: cat,
			ProManu: manu
		};
	    res.render('admin/proEdit', vm);
	});
});

router.post('/products/edit', (req, res) => {
	if (req.body.proPic === null || req.body.proPic === "")
	{
		productRepo.updateWithoutPic(req.body).then(value => {
	        var vm = {
	        	layout: 'admin.handlebars',
	            isUpdate: true
	        };
	        res.render('admin/proEdit', vm);
	    });
	}
	else 
	{
		productRepo.update(req.body).then(value => {
	        var vm = {
	        	layout: 'admin.handlebars',
	            isUpdate: true
	        };
	        res.render('admin/proEdit', vm);
	    });
	}
});

router.get('/products/add', restrict, (req, res) => {
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
        var vm = {
        	layout: 'admin.handlebars',
            isUpdate: true
        };
        res.render('admin/proAdd', vm);
    });
});

router.get('/suppliers', restrict, (req, res) => {

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

router.get('/suppliers/edit', restrict, (req, res) => {

	manuRepo.single(req.query.id).then(c => {
		var vm = {
			layout: 'admin.handlebars',
			Supplier: c
		};
	    res.render('admin/supEdit', vm);
	});
});

router.post('/suppliers/edit', (req, res) => {
	if (req.body.supLogo === null || req.body.supLogo === "")
	{
		manuRepo.updateWithoutLogo(req.body).then(value => {
	        var vm = {
	        	layout: 'admin.handlebars',
	            isUpdate: true
	        };
	        res.render('admin/supEdit', vm);
		});
	}
	else
	{
		manuRepo.update(req.body).then(value => {
	        var vm = {
	        	layout: 'admin.handlebars',
	            isUpdate: true
	        };
	        res.render('admin/supEdit', vm);
	    });
	}
});

router.get('/suppliers/add', restrict, (req, res) => {
	var vm = {
		layout: 'admin.handlebars'
	};
    res.render('admin/supAdd', vm);
});

router.post('/suppliers/add', (req, res) => {
    manuRepo.add(req.body).then(value => {
        var vm = {
			layout: 'admin.handlebars',
			isUpdate: true
		};
	    res.render('admin/supAdd', vm);
    });
});

module.exports = router;