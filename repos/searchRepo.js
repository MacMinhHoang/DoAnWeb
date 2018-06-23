var db = require('../fn/db');

exports.searchByName = (strSearch) => {
    var sql = `select * from sanpham where Ten like N'%${strSearch}%'`;
    return db.load(sql);
}

exports.searchByPrice = (strSearch) => {
    var sql = `select * from sanpham where GiaBan = ${strSearch}`;
    return db.load(sql);
}

exports.searchByBrand = (strSearch) => {
    var sql = `select * from sanpham where NhaSanXuat like N'%${strSearch}%'`;
    return db.load(sql);
}

exports.searchByCategory = (strSearch) => {
    var sql = `select * from sanpham 
                where loai = (select ID from loai where TenLoai like N'%${strSearch}%)`;
    return db.load(sql);
}

exports.searchByAll = (strSearch) => {
    var sql = `select * from sanpham 
                where loai = (select ID from loai where TenLoai like N'%${strSearch}%) 
                    or NhaSanXuat like N'%${strSearch}% or GiaBan = ${strSearch})`;
    return db.load(sql);
}