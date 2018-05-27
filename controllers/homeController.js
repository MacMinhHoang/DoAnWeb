var express = require('express');

var manuRepo = require('../repos/manufacturerRepo');

var router = express.Router();

router.get('/', (req, res) => {
	manuRepo.loadAll().then(rows => {
        var vm = {
            manufacturers: rows
        };
        res.render('home/index', vm);
    });

});

module.exports = router;