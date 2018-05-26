var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from sanpham';
    return db.load(sql);
}