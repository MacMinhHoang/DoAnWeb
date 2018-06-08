var express = require('express');

var router = express.Router();

var vm = {
	layout: 'admin.handlebars'
};

router.get('/', (req, res) => {
    res.render('admin/index', vm);
});

module.exports = router;