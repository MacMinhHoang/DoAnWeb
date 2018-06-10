var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from loai';
    return db.load(sql);
}

exports.loadWithLimit = (quantity, offset) => {
    var sql = `select * from loai limit ${quantity} offset ${offset}`;
    return db.load(sql);
}

exports.single = (CatID) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from loai where ID = ${CatID}`;
        db.load(sql).then(rows => {
            if (rows.length === 0) {
                resolve(null);
            } else {
                resolve(rows[0]);
            }
        }).catch(err => {
            reject(err);
        });
    });
}

exports.remove = (CatID) => {
    var sql = `update loai set TrangThai = '0' where ID = ${CatID}`;
    return db.load(sql);
} 

exports.update = (c) => {
    var sql = `update loai set TenLoai = '${c.catName}', TrangThai = '${c.catStatus}' where ID = ${c.catID}`;
    return db.save(sql);
}

exports.add = (c) => {
    var sql = `insert into loai (TenLoai, TrangThai) values ('${c.catName}', '${c.catStatus}')`;
    return db.save(sql);
}
