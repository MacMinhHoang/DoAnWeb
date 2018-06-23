var express = require('express');

var searchRepo = require('../repos/searchRepo');
// var config = require('../config/config');

var router = express.Router();

router.get('/', (req, res) => {
	var vm = {
		layout: 'main.handlebars'
	};
    res.render('product/search', vm);
});

router.get('/search', (req, res) => {
	if (req.query.search === 'name'){
		searchRepo.searchByName(req.query.key).then(result => {
			var vm = {
				layout: 'main.handlebars',
				results: result
			};
		    res.render('product/search', vm);
		});
	}
	else if (req.query.search === 'price'){
		searchRepo.searchByPrice(req.query.key).then(result => {
			var vm = {
				layout: 'main.handlebars',
				results: result
			};
		    res.render('product/search', vm);
		});
	}
	else if (req.query.search === 'brand'){
		searchRepo.searchByBrand(req.query.key).then(result => {
			var vm = {
				layout: 'main.handlebars',
				results: result
			};
		    res.render('product/search', vm);
		});
	}
	else if (req.query.search === 'category'){
		searchRepo.searchByCategory(req.query.key).then(result => {
			var vm = {
				layout: 'main.handlebars',
				results: result
			};
		    res.render('product/search', vm);
		});
	}
	else if (req.query.search === 'all'){
		searchRepo.searchByAll(req.query.key).then(result => {
			var vm = {
				layout: 'main.handlebars',
				results: result
			};
		    res.render('product/search', vm);
		});
	}
});

module.exports = router;