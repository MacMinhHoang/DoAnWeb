var categoryRepo = require('../repos/categoryRepo');
var manuRepo = require('../repos/manufacturerRepo');


module.exports = (req, res, next) => {

    var p1 = categoryRepo.loadWithLimit(2, 0),
	    p2 = categoryRepo.loadWithLimit(4, 2),
        p3 = manuRepo.loadWithLimit(3, 0),
        p4 = manuRepo.loadWithLimit(3, 3),
        p5 = manuRepo.loadWithLimit(3, 6);
    
    Promise.all([p1, p2, p3, p4, p5]).then(([pRows1, pRows2, pRows3, pRows4, pRows5]) => {
        res.locals.layoutVM = {
            Cat1: pRows1,
            Cat2: pRows2,
            Manu1: pRows3,
            Manu2: pRows4,
            Manu3: pRows5
        };
        next();
    });
};