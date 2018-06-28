var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from donhang';
    return db.load(sql);
}

exports.loadWithCus = (cus) => {
    var sql = `select *, STR_TO_DATE(ThoiGian,'%d/%m/%Y') as Ngay from donhang 
    where KhachHang = ${cus.ID} order by Ngay desc`;
    return db.load(sql);
}

exports.single = (OrderID) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from donhang where ID = ${OrderID}`;
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

exports.singleNewlyAdded = () => {
    var sql = `SELECT * from donhang order by ID desc limit 1`;
    return db.load(sql);
}

exports.update = (c) => {
	var status, ship;
	if (c.orderStatus == 0)
		status = ship = '0';
	else if (c.orderStatus == 1)
	{
		status = '0';
		ship = '1';
	}
	else 
	{
		status = '1';
		ship = '0';
	}
    var sql = `update donhang set TrangThai = ` + status + `, DangGiao = ` + ship + ` where ID = ${c.orderID}`;
    return db.save(sql);
}

exports.loadOrderProducts = (OrderID) => {
    var sql = `select p.ID, p.Ten, s.SoLuong from donhang d, sp_dh s, sanpham p 
    where d.ID = ${OrderID} and d.ID = s.DonHang and s.SanPham = p.ID`;
    return db.load(sql);
}

exports.add = (c) => {
    var sql = `insert into donhang (KhachHang, ThoiGian, TongTien, TrangThai, DangGiao) values
    ('${c.cusID}', '${c.orderDate}', ${c.orderTotal}, '0', '0')`;
    return db.save(sql);
}

exports.addOrderProduct = (IDDH, SP, SL) => {
    var sql = `insert into sp_dh (DonHang, SanPham, SoLuong)
                values (${IDDH}, ${SP}, ${SL})`;
    return db.save(sql);
}
