var db = require('../fn/db');

exports.login = (user) => {
    var sql = `select * from khachhang where TenDangNhap = '${user.username}' and MatKhau = '${user.password}'`;
    return db.load(sql);
}

exports.single = (CusID) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from khachhang where ID = ${CusID}`;
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

exports.singleWithOrderID = (OrderID) => {
    return new Promise((resolve, reject) => {
        var sql = `select k.* from khachhang k, donhang d where d.ID = ${OrderID} and d.KhachHang = k.ID`;
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

exports.update = (c) => {
    var sql = `update khachhang set HoTen = '${c.cusName}', NgaySinh = '${c.cusBirthday}', DiaChi = '${c.cusAddress}', 
    SDT = '${c.cusPhone}', Email = '${c.cusEmail}', GioiTinh = '${c.cusGender}' where ID = ${c.cusID}`;
    return db.save(sql);
}

exports.changePass = (cusID, pass) => {
    var sql = `update khachhang set MatKhau = '${pass}' where ID = ${cusID}`;
    return db.save(sql);
}

exports.checkUsername = (name) => {
    var sql = `select * from khachhang where TenDangNhap = '${name}'`;
    return db.load(sql);
}

exports.add = (c) => {
    var sql = `insert into khachhang (HoTen, NgaySinh, DiaChi, SDT, Email, TenDangNhap, MatKhau, GioiTinh) values
    ('${c.cusName}', '${c.cusBirthday}', '${c.cusAddress}', '${c.cusPhone}', '${c.cusEmail}', '${c.cusUsername}', 
    '${c.cusPassword}', '${c.cusGender}')`;
    return db.save(sql);
}