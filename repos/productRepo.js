var db = require('../fn/db');
var config = require('../config/config');

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
    var sql;
    sql = `update sanpham set Ten = '${c.proName}', HinhAnh = '/images/products/${c.proPic}', 
    GiaBan = ${c.proPrice}, SoLuotXem = ${c.proViews}, SoLuongTon = ${c.proInStore}, SoLuongBan = ${c.proSold},
    MoTa = '${c.proDes}', Loai = ${c.proCat}, NhaSanXuat = ${c.proSup}, NgayTiepNhan = '${c.proDate}'
    where ID = ${c.proID}`;
    return db.save(sql);
}

exports.updateWithoutPic = (c) => {
    var sql;
    sql = `update sanpham set Ten = '${c.proName}', GiaBan = ${c.proPrice}, SoLuotXem = ${c.proViews}, 
    SoLuongTon = ${c.proInStore}, SoLuongBan = ${c.proSold}, MoTa = '${c.proDes}', Loai = ${c.proCat}, 
    NhaSanXuat = ${c.proSup}, NgayTiepNhan = '${c.proDate}' where ID = ${c.proID}`;
    return db.save(sql);
}

exports.updateViews = (ProID) => {
    var sql;
    sql = `update sanpham set SoLuotXem = SoLuotXem + 1 where ID = ${ProID}`;
    return db.save(sql);
}

exports.add = (c) => {
    var sql = `insert into sanpham 
    (Ten, HinhAnh, GiaBan, SoLuotXem, SoLuongTon, SoLuongBan, MoTa, Loai, NhaSanXuat, NgayTiepNhan) values
    ('${c.proName}', '/images/products/${c.proPic}', ${c.proPrice}, ${c.proViews}, ${c.proInStore}, ${c.proSold}, 
    '${c.proDes}', ${c.proCat}, ${c.proSup}, '${c.proDate}')`;
    return db.save(sql);
}
// san pham moi nhat (10 cai dau)
exports.loadNewest = () => {
    var sql = `select *,STR_TO_DATE(NgayTiepNhan,'%d/%m/%Y') as Ngay from sanpham order by Ngay desc limit 10`;
    return db.load(sql);
}

exports.loadBestSelling = () => {
    var sql = `select * from sanpham order by SoLuongBan desc limit 10`;
    return db.load(sql);
} 

exports.mostViewed = () => {
    var sql = `select * from sanpham order by SoLuotXem desc limit 10`;
    return db.load(sql);
}

exports.searchbyBrand = (ID) => {
    var sql = `select s.*,nsx.TenNSX from sanpham s, nhasanxuat nsx where s.NhaSanXuat = nsx.ID and nsx.ID = '${ID}'`;
    return db.save(sql);

}

exports.searchbyCat =  (ID) => {
    var sql = `select s.* from sanpham s, loai l where s.Loai = l.ID and l.ID = '${ID}'`;
    return db.save(sql);
}

exports.loadAllByCat = (catId, offset) => {
    var sql = `select * from sanpham where Loai = ${catId} limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countByCat = (catId) => {
    var sql = `select count(*) as total from sanpham where Loai = ${catId}`;
    return db.load(sql);
}

exports.loadAllByBrand = (ID, offset) => {
    var sql = `select * from sanpham where NhaSanXuat = ${ID} limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countByBrand = (ID) => {
    var sql = `select count(*) as total from sanpham where NhaSanXuat = ${ID}`;
    return db.load(sql);
}

exports.updateAfterBought = (ID, SoLuong) => {
    var sql = `update sanpham set SoLuongBan = SoLuongBan + ${SoLuong}, SoLuongTon = SoLuongTon - ${SoLuong}
    where ID = ${ID}`;
    return db.save(sql);
}