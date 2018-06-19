var express = require('express');
	SHA256 = require('crypto-js/sha256'),
    moment = require('moment');

var accountRepo = require('../repos/accountRepo'),
    orderRepo = require('../repos/orderRepo');

var restrict = require('../middle-wares/restrict');

var router = express.Router();

var flag = false;

router.get('/', restrict, (req, res) => {
	accountRepo.single(req.session.user.ID).then(c => {
        var vm = {
            user: c
        };
        res.render('account/index', vm);
    });
});

router.post('/update', (req, res) => {
    accountRepo.update(req.body);
    res.redirect('/account');
});

router.get('/login', (req, res) => {
    var vm = {
        logging: flag,
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
        flag = true;
        if (rows.length > 0) {
            req.session.isLogged = true;
            req.session.user = rows[0];
            // req.session.cart = [];

            var url = '/';
            if (req.query.retUrl) {
                url = req.query.retUrl;
            }
            res.redirect(url);

        } else {
            var vm = {
                logging: flag,
                showError: true
            };
            res.render('account/login', vm);
        }
    });
});

router.post('/logout', (req, res) => {
    req.session.isLogged = false;
    req.session.user = null;
    flag = false;
    // req.session.cart = [];
    res.redirect(req.headers.referer);
});

router.get('/register', (req, res) => {
    res.render('account/register');
});

router.get('/orders', restrict, (req, res) => {
    orderRepo.loadWithCus(req.session.user).then(rows => {
        var vm = {
            orders: rows
        };
        res.render('account/orders');
    });
});

module.exports = router;