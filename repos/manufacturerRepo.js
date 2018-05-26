var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from nhasanxuat';
    return db.load(sql);
}

exports.loadWithLimit = (quantity, offset) => {
    var sql = `select * from nhasanxuat limit ${quantity} offset ${offset}`;
    return db.load(sql);
}