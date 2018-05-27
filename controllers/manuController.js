var express = require('express');

var manuRepo = require('../repos/manufacturerRepo');

var router = express.Router();

router.get('/', (req, res) => {

	var p1 = manuRepo.loadWithLimit(4, 0);
	var p2 = manuRepo.loadWithLimit(4, 4);
	var p3 = manuRepo.loadWithLimit(1, 8);

	Promise.all([p1, p2, p3]).then(([pRows1, pRows2, pRows3]) => {
		var vm = {
            manuRow1: pRows1,
            manuRow2: pRows2,
            manuRow3: pRows3
        };
        res.render('manufacturers/index', vm);
	});
});

module.exports = router;