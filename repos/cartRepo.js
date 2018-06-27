var db = require('../fn/db');


exports.add = (IDKH, IDSP, Soluong) => {
    var sql = `insert into giohang values('${IDKH}', '${IDSP}', ${Soluong})`;
    return db.save(sql);
}

exports.isExisted = (IDKH, IDSP)  => {
	var sql = `select * from giohang where IDKH = ${IDKH} and IDSP = ${IDSP}`
	return db.load(sql);
}

exports.update = (IDKH, IDSP, Soluong) => {
    var sql = `update giohang set Soluong = Soluong + ${Soluong} where IDKH = ${IDKH} and IDSP = ${IDSP}`;
    return db.save(sql);
}

exports.update1 = (IDKH, IDSP, Soluong) => {
    var sql = `update giohang set Soluong = ${Soluong} where IDKH = ${IDKH} and IDSP = ${IDSP}`;
    return db.save(sql);
}

exports.remove = (IDKH, IDSP) => {
	var sql = `delete from giohang where IDKH = ${IDKH} and IDSP = ${IDSP}`;
    return db.save(sql);
}

exports.loadAll = (IDKH) => {
	var sql = `select * from sanpham, giohang
				where ID = IDSP and IDKH = ${IDKH}`;
	return db.load(sql);
}