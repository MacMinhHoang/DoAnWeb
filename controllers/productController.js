var express = require('express');
var config = require('../config/config');
//var config = require('../config/config');

var searchRepo = require('../repos/searchRepo');
var productRepo = require('../repos/productRepo');
var manuRepo = require('../repos/manufacturerRepo');
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
		var page = req.query.page; 
    	if (!page) {
       		page = 1;
   		 }

    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

    var p1 = searchRepo.loadSearchByName(strSearch, offset);
    var p2 = searchRepo.countSearchByName(strSearch);
    var p3 = searchRepo.searchByName(strSearch);
    console.log(strSearch);
    Promise.all([p1, p2, p3]).then(([pRows1, countRows, pRows2]) => {
    	var total = countRows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0) {
            nPages++;
        }

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }

        var vm = {
            products: pRows2,
            page_numbers: numbers,
        };
  	 res.render('product/search', vm);
    });
}
});
// 	else if (req.query.search === 'price'){
// 		searchRepo.searchByPrice(strSearch).then(result => {
// 			var vm = {
// 				results: result
// 			};
// 		    res.render('product/search', vm);
// 		});
// 	}
// 	else if (req.query.search === 'brand'){
// 		searchRepo.searchByBrand(strSearch).then(result => {
// 			var vm = {
// 				results: result
// 			};
// 		    res.render('product/search', vm);
// 		});
// 	}
// 	else if (req.query.search === 'category'){
// 		searchRepo.searchByCategory(strSearch).then(result => {
// 			var vm = {
// 				results: result
// 			};
// 		    res.render('product/search', vm);
// 		});
// 	}
// });

router.get('/detail', (req, res) => {
	var p1 = productRepo.single(req.query.id);
	var p2 = searchRepo.listSameBrand(req.query.id, 5);
	var p3 = searchRepo.listSameCategory(req.query.id, 5);
	
	productRepo.updateViews(req.query.id);
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

router.get('/byBrand', (req, res) => {

	var page = req.query.page;

    var catID = req.query.id; 


    if (!page) {
        page = 1;
    }

    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

    var p1 = productRepo.loadAllByBrand(catID, offset);
    var p2 = productRepo.countByBrand(catID);
    var p3 = manuRepo.single(catID);

    Promise.all([p1, p2, p3]).then(([pRows, countRows, pRows2]) => {
       
        var total = countRows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0) {
            nPages++;
        }

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }

        var vm = {
        	type: pRows2,
            products: pRows,
            noProducts: pRows.length === 0,
            page_numbers: numbers,
            id: catID
        };
        res.render('product/byBrand', vm);

	});
});


router.get('/byCat', (req, res) => {

    var page = req.query.page;

    var catID = req.query.id; 


    if (!page) {
        page = 1;
    }

    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

    var p1 = productRepo.loadAllByCat(catID, offset);
    var p2 = productRepo.countByCat(catID);
    var p3 = manuRepo.singleType(catID);
   
    Promise.all([p1, p2, p3]).then(([pRows, countRows, pRows2]) => {
       
        var total = countRows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0) {
            nPages++;
        }

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }

        var vm = {
        	type: pRows2,
            products: pRows,
            noProducts: pRows.length === 0,
            page_numbers: numbers,
            id: catID
        };
        res.render('product/byCat', vm);
    });
});
module.exports = router;