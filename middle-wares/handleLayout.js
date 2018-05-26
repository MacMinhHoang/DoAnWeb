var categoryRepo = require('../repos/categoryRepo');
var manuRepo = require('../repos/manufacturerRepo');


module.exports = (req, res, next) => {

	categoryRepo.loadWithLimit(2, 0).then(rows => {
        res.locals.layoutVM1 = {
            categories: rows,
        };
        // next();
    });

    categoryRepo.loadWithLimit(4, 2).then(rows => {
        res.locals.layoutVM2 = {
            categories: rows,
        };
        // next();
    });

    manuRepo.loadWithLimit(3, 0).then(rows => {
        res.locals.layoutVM3 = {
            manufacturers: rows,
        };
        // next();
    });

    manuRepo.loadWithLimit(3, 3).then(rows => {        
        res.locals.layoutVM4 = {
            manufacturers: rows,
        };
        // next();
    });

    manuRepo.loadWithLimit(3, 6).then(rows => {
        res.locals.layoutVM5 = {
            manufacturers: rows,
        };
        next();
    });
};