module.exports = (req, res, next) => {
    if (req.session.isLogged === true && req.session.user != null) {
        next();
    } else {
        res.redirect(`/account/login?retUrl=${req.originalUrl}`);
    }
}