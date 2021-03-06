var express = require('express');
	SHA256 = require('crypto-js/sha256'),
    moment = require('moment');

var accountRepo = require('../repos/accountRepo'),
    orderRepo = require('../repos/orderRepo'),
    adminRepo = require('../repos/adminRepo');

var restrict = require('../middle-wares/restrictUser');

var router = express.Router();

router.get('/', restrict, (req, res) => {
	accountRepo.single(req.session.user.ID).then(c => {
        var vm = {
            user: c
        };
        res.render('account/index', vm);
    });
});

router.post('/update', (req, res) => {
    accountRepo.update(req.body).then(c => {
        var vm = {
            isUpdate: true
        };
        res.render('account/index', vm);
    });
    
});

router.get('/login', (req, res) => {
    var vm = {
        logging: false,
        showError: false
    }
    res.render('account/login', vm);
});

router.post('/login', (req, res) => {
    var user = {
        username: req.body.username,
        password: SHA256(req.body.rawPass).toString()
    };

    accountRepo.login(user).then(rows => {
        if (rows.length > 0) {
            req.session.isLogged = true;
            req.session.user = rows[0];
            req.session.admin = null;
            // req.session.cart = [];

            var url = '/';
            if (req.query.retUrl) {
                url = req.query.retUrl;
            }
            var vm = {
                logging: true,
                showError: false,
                GoTo: url 
            };
            res.render('account/login', vm);

        } else {

            adminRepo.login(user).then(rows => {
                if (rows.length > 0) {
                    req.session.isLogged = true;
                    req.session.admin = rows[0];
                    req.session.user = null;

                    var vm = {
                        logging: true,
                        showError: false,
                        GoTo: '/admin' 
                    };
                    res.render('account/login', vm);

                } else {
                    var vm = {
                        logging: true,
                        showError: true
                    };
                    res.render('account/login', vm);
                }
            });
        }
    });
});

router.post('/logout', (req, res) => {
    req.session.isLogged = false;
    req.session.user = null;
    // req.session.cart = [];
    res.redirect(req.headers.referer);
});

router.get('/register', (req, res) => {
     var vm = {
        Duplicate: false,
        isChecked: false
    };
    res.render('account/register', vm);
});

router.post('/register', (req, res) => {
    accountRepo.checkUsername(req.body.cusUsername).then(rows => {
        if (rows.length > 0)
        {
            var vm = {
                Duplicate: true,
                isChecked: false,
                Fields: req.body
            };
            res.render('account/register', vm);
        }
        else
        {
            req.body.cusPassword = SHA256(req.body.cusPassword).toString();
            accountRepo.add(req.body).then(value => {
                var vm = {
                    Duplicate: false,
                    isChecked: true,
                };
                res.render('account/register', vm);
            });
        }
    });
   
});

router.get('/orders', restrict, (req, res) => {
    orderRepo.loadWithCus(req.session.user).then(rows => {
        var vm = {
            orders: rows
        };
        res.render('order/index', vm);
    });
});

router.get('/orders/detail', restrict, (req, res) => {
    var p1 = orderRepo.single(req.query.id),
        p2 = accountRepo.singleWithOrderID(req.query.id),
        p3 = orderRepo.loadOrderProducts(req.query.id);

    Promise.all([p1, p2, p3]).then(([a, b, pRows]) => {
        var vm = {
            order: a,
            customer: b,
            products: pRows
        };
        res.render('order/detail', vm);
    });
});

router.get('/changepass', restrict, (req, res) => {
     var vm = {
        isError: false,
        isChecked: false
    };
    res.render('account/password', vm);
});

router.post('/changepass', (req, res) => {
    var hash = SHA256(req.body.cusOldPass).toString();
    if (hash.toUpperCase() !== req.session.user.MatKhau)
    {
        var vm = {
            isError: true,
            isChecked: true
        };
        res.render('account/password', vm);
    }
    else 
    {
        var newHash = SHA256(req.body.cusNewPass);
        accountRepo.changePass(req.session.user.ID, newHash).then(rows => {
            req.session.user.MatKhau = newHash;
            var vm = {
                isError: false,
                isChecked: true
            };
            res.render('account/password', vm);
        });
    }
});

module.exports = router;