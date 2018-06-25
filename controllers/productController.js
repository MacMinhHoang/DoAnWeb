var express = require('express');

var searchRepo = require('../repos/searchRepo');
var productRepo = require('../repos/productRepo');

// var config = require('../config/config');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('product/search');
});

router.get('/search', (req, res) => {
	var strSearch = req.query.key;
	var intIndexOfMatch = strSearch.indexOf('_');

	// Keep looping while an instance of the target string
	// still exists in the string.
	while (intIndexOfMatch != -1){
		// Relace out the current instance.
		strSearch = strSearch.replace('_',' ');

		// Get the index of any next matching substring.
		intIndexOfMatch = strSearch.indexOf('_');
    }

	if (req.query.search === 'name'){
		searchRepo.searchByName(strSearch).then(result => {
			var vm = {
				results: result
			};
		    res.render('product/search', vm);
		});
	}
	else if (req.query.search === 'price'){
		searchRepo.searchByPrice(strSearch).then(result => {
			var vm = {
				results: result
			};
		    res.render('product/search', vm);
		});
	}
	else if (req.query.search === 'brand'){
		searchRepo.searchByBrand(strSearch).then(result => {
			var vm = {
				results: result
			};
		    res.render('product/search', vm);
		});
	}
	else if (req.query.search === 'category'){
		searchRepo.searchByCategory(strSearch).then(result => {
			var vm = {
				results: result
			};
		    res.render('product/search', vm);
		});
	}
	else if (req.query.search === 'all'){
		searchRepo.searchByAll(strSearch).then(result => {
			var vm = {
				results: result
			};
		    res.render('product/search', vm);
		});
	}
});

router.get('/detail', (req, res) => {
	var p1 = productRepo.single(req.query.id);
	var p2 = searchRepo.listSameBrand(req.query.id, 5);
	var p3 = searchRepo.listSameCategory(req.query.id, 5);

	Promise.all([p1, p2, p3]).then(([pRow1, pRow2, pRow3]) => {
		var vm = {
			singlePro: pRow1,
			MoreFromThisBrand: pRow2,
			MoreFromThisCategory: pRow3
		};
		res.render('product/detail', vm);
	});
});

router.get('/quickview', (req, res) => {
	productRepo.single(req.query.id).then(result => {
		var vm = {
			quickview: result
		};
		res.render('product/quickview', vm);
	});
});

module.exports = router;