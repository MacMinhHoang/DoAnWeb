var express = require('express');

var manuRepo = require('../repos/manufacturerRepo');

var proRepo = require('../repos/productRepo');

var router = express.Router();

router.get('/', (req, res) => {

	var p1 = proRepo.loadNewest();
	var p2 = proRepo.loadBestSelling();
	var p3 = proRepo.mostViewed();
	var p4 = manuRepo.loadAll();
	
	Promise.all([p1, p2, p3, p4]).then(([pRows1, pRows2, pRows3, pRows4]) => {
		 var vm = {
		 	newest: pRows1,
		 	bestsell: pRows2,
		 	mostview: pRows3,
            manufacturers: pRows4
        };
        res.render('home/index', vm);
	});

});

module.exports = router;