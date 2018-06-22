var db = require('../fn/db');

exports.login = (user) => {
    var sql = `select * from admin where TenDangNhap = '${user.username}' and MatKhau = '${user.password}'`;
    return db.load(sql);
}
