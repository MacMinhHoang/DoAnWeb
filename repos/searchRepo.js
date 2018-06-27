var db = require('../fn/db');
var config = require('../config/config');

exports.searchByName = (strSearch) => {
    var sql = `select * from sanpham where Ten like N'%${strSearch}%'`;
    return db.load(sql);
}

exports.loadSearchByName = (str, offset) => {
    var sql = `select * from sanpham where Ten like N'%${str}%' limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countSearchByName = (str) => {
    var sql = `select count(*) as total from sanpham where Ten like N'%${str}%'`;
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

exports.listSameBrand = (ProID, count) => {
    var sql = `select * from sanpham where NhaSanXuat = (select NhaSanXuat from sanpham where ID = ${ProID}) limit ${count}`;
    return db.load(sql);
}

exports.listSameCategory = (ProID, count) => {
    var sql = `select * from sanpham where Loai = (select Loai from sanpham where ID = ${ProID}) limit ${count}`;
    return db.load(sql);
}