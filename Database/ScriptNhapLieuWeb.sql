INSERT INTO khachhang (ID,HoTen,NgaySinh,DiaChi,SDT,Email,TenDangNhap,MatKhau,GioiTinh) VALUES 
('1', 'Nguyễn Lê Huy', '1997-01-11', '54 Lê Quang Định', '01648002334', 'ab@gmail.com', 'huynl', 'yaoming2010', '1')

INSERT INTO khachhang (ID,HoTen,NgaySinh,DiaChi,SDT,Email,TenDangNhap,MatKhau,GioiTinh) VALUES ('2', 'Mạc Minh Hoàng', '1997-04-15', '133/5 Trần Phú', '01632348754', 'hoang@gmail.com', 'hoangmm', 'minhhoang', '0')


INSERT INTO khachhang (ID,HoTen,NgaySinh,DiaChi,SDT,Email,TenDangNhap,MatKhau,GioiTinh) VALUES ('3', 'Đỗ Huy Gia Cát', '1997-07-12', '12/4/5 Lương Ngọc Quyến', '0903567410', 'cat@gmail.com', 'catdhg', 'cat123', '1')

INSERT INTO donhang (ID,KhachHang,ThoiGian,TongTien,TrangThai) VALUES 
('100001','1','2018-05-14','11490000','0');

INSERT INTO donhang (ID,KhachHang,ThoiGian,TongTien,TrangThai) VALUES 
('100002','1','2018-02-05','10390000','2');

INSERT INTO donhang (ID,KhachHang,ThoiGian,TongTien,TrangThai) VALUES 
('100003','3','2018-03-07','115000000','1');

delete from donhang where ID = '100003'

INSERT INTO loai (ID, TenLoai) VALUES ('1','Super-zoom Camera');

INSERT INTO loai (ID, TenLoai) VALUES ('2','Mirrorless Camera');

INSERT INTO loai (ID, TenLoai) VALUES ('3','Professional Camera');

INSERT INTO loai (ID, TenLoai) VALUES ('4','Travel Camera');

INSERT INTO loai (ID, TenLoai) VALUES ('5','Waterproof Camera');

INSERT INTO nhasanxuat (ID, TenNSX) VALUES ('1','Canon');

INSERT INTO nhasanxuat (ID, TenNSX) VALUES ('2','Dahua');

INSERT INTO nhasanxuat (ID, TenNSX) VALUES ('3','Fujifilm');

INSERT INTO nhasanxuat (ID, TenNSX) VALUES ('4','GoPro');

INSERT INTO nhasanxuat (ID, TenNSX) VALUES ('5','Logitech');

INSERT INTO nhasanxuat (ID, TenNSX) VALUES ('6','Nikon');

INSERT INTO nhasanxuat (ID, TenNSX) VALUES ('7','Olympus');

INSERT INTO nhasanxuat (ID, TenNSX) VALUES ('8','Pentax');

INSERT INTO nhasanxuat (ID, TenNSX) VALUES ('9','Sony');

INSERT INTO sanpham (ID,Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan)
VALUES ('00001','CANON EOS 5D MARK III KIT EF 24-105 F4L IS USM','/products/Canon/[2].CANON EOS 5D MARK 
III KIT EF 24-105 F4L IS USM/2-3.jpg','57500000','5240','920','523','Khả năng chụp
 liên tục 950 tấm ảnh chỉ với 1 lần sạc pin, máy ảnh Canon EOS 5D Mark III là sự lựa chọn hoàn hảo trong tầm
 giá cho bất cứ ai. Bên cạnh đó, bộ xử lý hình ảnh được nần cấp mạnh hơn 17 lần so với đàn anh 5D Mark II là
 một điểm đáng chú ý của sản phẩm này.','3','1','2017-12-7');

INSERT INTO sanpham (ID,Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan)
VALUES ('00002','FUJIFILM X-A3 KIT XC16-50 F3.5-5.6 OIS II (NÂU)','/products/Fujifilm/FUJIFILM_ X-A3-Nau.jpg'
,'10390000','1462','45','14','Người dùng vẫn yêu thích sự hoài cổ trong từng đường nét, và  máy ảnh Fujifilm
 X-A3 vẫn làm say đắm với sự cổ điển vốn có từ đàn anh X-A2. Các màu sắc như hồng, mâu và đen như những chiếc 
 ao mới, làm nổi bật thêm sự độc đáo vốn đã có của cái tên đình đám.','4','3','2015-05-04');
 
 INSERT INTO sanpham (ID,Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan)
VALUES ('00003','OLYMPUS STYLUS TOUGH TG-5','/products/Olympus/OLYMPUS STYLUS TOUGH TG-5/1.jpg','11490000','528
','421','233','Nhà sản xuất máy ảnh đình đám với các sản phẩm "nồi đồng cối đá" Olympus mới đây vừa tung ra 
mẫu máy ảnh Tough TG-5. Sản phẩm trang bị cảm biến thế hệ mới cùng khả năng quay video 4K đầy mạnh mẽ.
Theo Petapixel, Olympus Tough TG-5 sở hữu cảm biến thế hệ mới, bộ vi xử lý nâng cấp và tính năng quay video 4K.
 Ngoài ra, nhà sản xuất cũng cung cấp một bộ vỏ bọc chống nước, chống shock cũng như chống ăn mòn và bụi bẩn.',
 '5','7','2016-12-01');
 
INSERT INTO sp_dh (ID,DonHang,SanPham,SoLuong) VALUES ('1','100002','2','1');
 
INSERT INTO sp_dh (ID,DonHang,SanPham,SoLuong) VALUES ('2','100001','3','1');
 
INSERT INTO sp_dh (ID,DonHang,SanPham,SoLuong) VALUES ('3','100003','1','2');
 