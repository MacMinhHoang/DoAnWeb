var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from nhasanxuat';
    return db.load(sql);
}

exports.loadWithLimit = (quantity, offset) => {
    var sql = `select * from nhasanxuat limit ${quantity} offset ${offset}`;
    return db.load(sql);
}

exports.single = (NSXID) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from nhasanxuat where ID = ${NSXID}`;
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

exports.singleProID = (ProID) => {
    return new Promise((resolve, reject) => {
        var sql = `select n.* from nhasanxuat n, sanpham s where s.ID = ${ProID} and s.NhaSanXuat = n.id`;
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

exports.remove = (NSXID) => {
    var sql = `update nhasanxuat set TrangThai = '0' where ID = ${NSXID}`;
    return db.load(sql);
} 

exports.update = (c) => {
    var sql = `update nhasanxuat set TenNSX = '${c.supName}', Logo = '/images/logo/${c.supLogo}', 
    TrangThai = '${c.supStatus}' where ID = ${c.supID}`;
    return db.save(sql);
}

exports.updateWithoutLogo = (c) => {
    var sql = `update nhasanxuat set TenNSX = '${c.supName}', TrangThai = '${c.supStatus}' where ID = ${c.supID}`;
    return db.save(sql);
}

exports.add = (c) => {
    var sql = `insert into nhasanxuat (TenNSX, Logo, TrangThai) 
    values ('${c.supName}', '/images/logo/${c.supLogo}', '${c.supStatus}')`;
    return db.save(sql);
}


