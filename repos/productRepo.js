var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from sanpham';
    return db.load(sql);
}

exports.single = (ProID) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from sanpham where ID = ${ProID}`;
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

exports.remove = (ProID) => {
    var sql = `update sanpham set SoLuongTon = 0 where ID = ${ProID}`;
    return db.load(sql);
} 

exports.update = (c) => {
    var sql = `update sanpham set Ten = '${c.proName}', HinhAnh = '/images/products/${c.proPic}', 
	GiaBan = ${c.proPrice}, SoLuotXem = ${c.proViews}, SoLuongTon = ${c.proInStore}, SoLuongBan = ${c.proSold},
	MoTa = '${c.proDes}', Loai = ${c.proCat}, NhaSanXuat = ${c.proSup}, NgayTiepNhan = ${c.proDate}
    where ID = ${c.proID}`;
    return db.save(sql);
}

exports.add = (c) => {
    var sql = `insert into sanpham 
    (Ten, HinhAnh, GiaBan, SoLuotXem, SoLuongTon, SoLuongBan, MoTa, Loai, NhaSanXuat, NgayTiepNhan) values
    ('${c.proName}', '/images/products/${c.proPic}', ${c.proPrice}, ${c.proViews}, ${c.proInStore}, ${c.proSold}, 
    '${c.proDes}', ${c.proCat}, ${c.proSup}, ${c.proDate})`;
    return db.save(sql);
}