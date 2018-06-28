var categoryRepo = require('../repos/categoryRepo'),
    manuRepo = require('../repos/manufacturerRepo'),
    cartRepo = require('../repos/cartRepo');


module.exports = (req, res, next) => {

    if (req.session.isLogged === undefined) {
        req.session.isLogged = false;
    }

    var userLogged = false;
    var id = 99999999;
    if (req.session.user != null)
    {
        userLogged = true;
        id = req.session.user.ID;
    }

    // if (req.session.admin === null || req.session.admin === undefined)
    {
        var p1 = categoryRepo.loadWithLimit(2, 0),
    	    p2 = categoryRepo.loadWithLimit(4, 2),
            p3 = manuRepo.loadWithLimit(3, 0),
            p4 = manuRepo.loadWithLimit(3, 3),
            p5 = manuRepo.loadWithLimit(3, 6),
            p6 = cartRepo.count(id);
        
        Promise.all([p1, p2, p3, p4, p5, p6]).then(([pRows1, pRows2, pRows3, pRows4, pRows5, count]) => {
            res.locals.layoutVM = {
                Cat1: pRows1,
                Cat2: pRows2,
                Manu1: pRows3,
                Manu2: pRows4,
                Manu3: pRows5,
                isLogged: userLogged,
                curUser: req.session.user,
                cartCount: count
            };
            next();
        });
    }
    // else {
    //     res.locals.layoutVM = {
    //         isLogged: true,
    //         Admin: req.session.admin
    //     };
    // }
};