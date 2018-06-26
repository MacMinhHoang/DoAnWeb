-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mystoredb
-- ------------------------------------------------------
-- Server version	5.7.21-log


CREATE SCHEMA `mystoredb` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;

USE `mystoredb`;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE `khachhang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  --
  `NgaySinh` varchar(20) DEFAULT NULL,
  `DiaChi` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `SDT` char(12) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `TenDangNhap` varchar(30) DEFAULT NULL,
  `MatKhau` varchar(200) DEFAULT NULL,
  `GioiTinh` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `khachhang` AUTO_INCREMENT=11111001;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `TenDangNhap` varchar(30) NOT NULL,
  `MatKhau` varchar(200) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TenDangNhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
CREATE TABLE `donhang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KhachHang` int(11) DEFAULT NULL,
  `ThoiGian` varchar(50) DEFAULT NULL,
  `TongTien` float DEFAULT NULL,
  `TrangThai` tinyint(4) DEFAULT NULL,
  `DangGiao` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_donhang_khachhang_idx` (`KhachHang`),
  CONSTRAINT `FK_donhang_khachhang` FOREIGN KEY (`KhachHang`) REFERENCES `khachhang` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `donhang` AUTO_INCREMENT=123456001;

--
-- Table structure for table `loai`
--

DROP TABLE IF EXISTS `loai`;
CREATE TABLE `loai` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoai` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `TrangThai` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `nhasanxuat`
--

DROP TABLE IF EXISTS `nhasanxuat`;
CREATE TABLE `nhasanxuat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TenNSX` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TrangThai` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `nhasanxuat` AUTO_INCREMENT=33333001;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE `sanpham` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ten` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `HinhAnh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GiaBan` float DEFAULT NULL,
  `SoLuotXem` int(11) NOT NULL,
  `SoLuongTon` int(11) DEFAULT NULL,
  `SoLuongBan` int(11) DEFAULT NULL,
  `MoTa` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  `Loai` int(11) DEFAULT NULL,
  `NhaSanXuat` int(11) DEFAULT NULL,
  `NgayTiepNhan` varchar(20) DEFAULT NULL,
  --
  `XuatXu` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_sanpham_loai_idx` (`Loai`),
  KEY `FK_sanpham_nsx_idx` (`NhaSanXuat`),
  CONSTRAINT `FK_sanpham_loai` FOREIGN KEY (`Loai`) REFERENCES `loai` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sanpham_nsx` FOREIGN KEY (`NhaSanXuat`) REFERENCES `nhasanxuat` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `sanpham` AUTO_INCREMENT=789654001;

--
-- Table structure for table `sp_dh`
--

DROP TABLE IF EXISTS `sp_dh`;
CREATE TABLE `sp_dh` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DonHang` int(11) DEFAULT NULL,
  `SanPham` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_spdh_dh_idx` (`DonHang`),
  KEY `FK_spdh_sp_idx` (`SanPham`),
  CONSTRAINT `FK_spdh_dh` FOREIGN KEY (`DonHang`) REFERENCES `donhang` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_spdh_sp` FOREIGN KEY (`SanPham`) REFERENCES `sanpham` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `giohang`
--

DROP TABLE IF EXISTS `giohang`;
CREATE TABLE `giohang` (
  `IDKH` int(11) NOT NULL,
  `IDSP` int(11) NOT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDKH`, `IDSP`),
  KEY `FK_giohang_kh_idx` (`IDKH`),
  KEY `FK_giohang_sp_idx` (`IDSP`),
  CONSTRAINT `FK_giohang_kh` FOREIGN KEY (`IDKH`) REFERENCES `khachhang` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_giohang_sp` FOREIGN KEY (`IDSP`) REFERENCES `sanpham` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

USE `mystoredb`;

/* pass : yaoming2010 */
INSERT INTO khachhang (HoTen,NgaySinh,DiaChi,SDT,Email,TenDangNhap,MatKhau,GioiTinh) VALUES 
('Nguyễn Lê Huy', '11/01/1997', '54 Lê Quang Định', '01648002334', 'ab@gmail.com', 
'huynl', '2526AF6ED6934F708D0DC6A839B555D5812BE47B012E0FC7818C8DF54BA83051','1');

/* pass : hoang12124 */
INSERT INTO khachhang (HoTen,NgaySinh,DiaChi,SDT,Email,TenDangNhap,MatKhau,GioiTinh) VALUES 
('Mạc Minh Hoàng', '10/03/1997', '133/5 Trần Phú', '01632348754', 'hoang@gmail.com', 
'hoangmm', '79D1104B7C226E6427015339601B1326CFE31F9D2A42695309E4F8A6183EC91A', '1');

/* pass : cat123 */
INSERT INTO khachhang (HoTen,NgaySinh,DiaChi,SDT,Email,TenDangNhap,MatKhau,GioiTinh) VALUES
 ('Đỗ Huy Gia Cát', '12/07/1997', '12/4/5 Lương Ngọc Quyến', '0903567410', 'cat@gmail.com', 
 'catdhg', '36515A322EFDE414A1991048DA44BC65623C8E1C31F8C30C652AEEE05428C237', '1');
 
 INSERT INTO admin VALUES 
 ('admin', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', 'animeneverdie@gmail.com');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111001','14/05/2018','11490000','0','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111002','05/02/2018','10390000','0','1');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111003','07/03/2018','115000000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111002','06/01/2016','15200000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111003','24/01/2017','40000000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111001','24/11/2014','9000000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111001','04/12/2015','12000000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111002','07/04/2016','105000000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111001','15/12/2017','5000000','1','0');




INSERT INTO loai (ID, TenLoai, TrangThai) VALUES ('1', 'Professional Camera', '1');

INSERT INTO loai (ID, TenLoai, TrangThai) VALUES ('2', 'Travel Camera', '1');

INSERT INTO loai (ID, TenLoai, TrangThai) VALUES ('3', 'Mirrorless Camera', '1');

INSERT INTO loai (ID, TenLoai, TrangThai) VALUES ('4', 'Super-zoom Camera', '1');

INSERT INTO loai (ID, TenLoai, TrangThai) VALUES ('5','Waterproof Camera', '1');

INSERT INTO loai (ID, TenLoai, TrangThai) VALUES ('6','Others', '1');
 
INSERT INTO nhasanxuat (TenNSX, Logo, TrangThai) VALUES ('Canon', '/images/logo/33333001.png', '1');

INSERT INTO nhasanxuat (TenNSX, Logo, TrangThai) VALUES ('Dahua', '/images/logo/33333002.png', '1');

INSERT INTO nhasanxuat (TenNSX, Logo, TrangThai) VALUES ('Fujifilm', '/images/logo/33333003.png', '1');

INSERT INTO nhasanxuat (TenNSX, Logo, TrangThai) VALUES ('GoPro', '/images/logo/33333004.png', '1');

INSERT INTO nhasanxuat (TenNSX, Logo, TrangThai) VALUES ('Logitech', '/images/logo/33333005.png', '1');

INSERT INTO nhasanxuat (TenNSX, Logo, TrangThai) VALUES ('Nikon', '/images/logo/33333006.png', '1');

INSERT INTO nhasanxuat (TenNSX, Logo, TrangThai) VALUES ('Olympus', '/images/logo/33333007.png', '1');

INSERT INTO nhasanxuat (TenNSX, Logo, TrangThai) VALUES ('Pentax', '/images/logo/33333008.png', '1');

INSERT INTO nhasanxuat (TenNSX, Logo, TrangThai) VALUES ('Sony', '/images/logo/33333009.png', '1');

INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('CANON EOS 5D MARK III KIT EF 24-105 F4L IS USM','/images/products/789654001-1.jpg','57500000','5240','920','523','Khả năng chụp
 liên tục 950 tấm ảnh chỉ với 1 lần sạc pin, máy ảnh Canon EOS 5D Mark III là sự lựa chọn hoàn hảo trong tầm
 giá cho bất cứ ai. Bên cạnh đó, bộ xử lý hình ảnh được nần cấp mạnh hơn 17 lần so với đàn anh 5D Mark II là
 một điểm đáng chú ý của sản phẩm này.','3','33333001','12/07/2017','Nhật Bản');

INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('FUJIFILM X-A3 KIT XC16-50 F3.5-5.6 OIS II (NÂU)','/images/products/789654002-1.jpg'
,'10390000','1462','45','14','Người dùng vẫn yêu thích sự hoài cổ trong từng đường nét, và  máy ảnh Fujifilm
 X-A3 vẫn làm say đắm với sự cổ điển vốn có từ đàn anh X-A2. Các màu sắc như hồng, mâu và đen như những chiếc 
 ao mới, làm nổi bật thêm sự độc đáo vốn đã có của cái tên đình đám.','4','33333003','04/05/2015','Indonesia');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('OLYMPUS STYLUS TOUGH TG-5','/images/products/789654003-1.jpg','11490000','528','421','233','Nhà sản xuất máy ảnh đình đám với các sản phẩm "nồi đồng cối đá" Olympus mới đây vừa tung ra 
mẫu máy ảnh Tough TG-5. Sản phẩm trang bị cảm biến thế hệ mới cùng khả năng quay video 4K đầy mạnh mẽ.
Theo Petapixel, Olympus Tough TG-5 sở hữu cảm biến thế hệ mới, bộ vi xử lý nâng cấp và tính năng quay video 4K.
 Ngoài ra, nhà sản xuất cũng cung cấp một bộ vỏ bọc chống nước, chống shock cũng như chống ăn mòn và bụi bẩn.',
 '5','33333007','01/12/2016','Singapore');
 
INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('Camera IP Wifi DAHUA IPC-C10','/images/products/789654004-1.jpg','2600000','158','70','42','Camera IP
 Wifi là dòng sản phẩm mới với thiết kế nhỏ  gọn tính năng vượt trội không cần sử dụng qua đầu ghi hình ,âm thanh
 hai chiều, hình ảnh sắc nét cài đặt sử dụng đơn giản bạn có thể tự lắp đặt hoàn toàn không dây rất phù hợp với
 gia đình, văn phòng, công ty...vv...','6','33333002','11/07/2015','Trung Quốc');

 
INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('GoPro Fusion','/images/products/789654005-1.jpg','17990000','245','40','5','Theo Slashgear, GoPro Fusion là mẫu
 action cam 360 độ mới nhất của GoPro, hỗ trợ quay video 5.2K tốc độ 30fps hoặc 3K 60fps. Máy cũng có thể chụp 
 ảnh tĩnh với độ phân giải 18MP, tính năng ổn định và chống rung kỹ thuật số. Đặc biệt nhờ hỗ trợ âm thanh 360
 độ, máy sẽ tạo trải nghiệm video liền mạch và ấn tượng hơn.','6','33333004','18/09/2017','Mỹ');
 
  
INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('CANON IXUS 185 (ĐEN)','/images/products/789654006-1.jpg','2350000','1502','400','240',
'Máy ảnh Canon IXUS 185 kết hợp cảm biến 20.0 MP cùng bộ xử lý ảnh DIGIC 4+ góp phần không nhỏ mang đến cho
 bạn những bức ảnh với màu sắc đẹp và các chi tiết rõ nét ở mức tối đa. Bên cạnh đó, dải ISO ở mức 100 
 - 800 sẽ hỗ trợ rất tốt ở những nơi mà bạn chụp ảnh thiếu sáng.','4','33333001','12/11/2016','Trung Quốc');
 
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('SONY CYBERSHOT DSC H300 (ĐEN)','/images/products/789654007-1.jpg','3450000','1042','150','63',
'Máy ảnh Sony Cybershot DSC H300 là chiếc máy ảnh du lịch được thiết kế với kiểu dáng hầm hố theo phong cách 
của những chiếc máy ảnh DSLR. Chiếc máy ảnh này sẽ mang lại cho bạn những trải nghiệm tuyệt vời với khả năng
 chụp ảnh đa dạng. Hãy để những khoảnh khắc ấn tượng nằm trong tầm tay bạn.','1','33333009','24/07/2015','Trung Quốc');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('NIKON D5600 KIT AF-P 18-55 VR','/images/products/789654008-1.jpg','15900000','423','100','5','Máy ảnh
 Nikon D5600 là mẫu máy ảnh được sản xuất nhằm khắc phục những thiếu sót mà người đàn anh D5500 để lại. Với
 những tính năng vượt trội cùng với những khả năng kết nối và chia sẽ thông minh, chiếc máy ảnh DSLR Nikon mới
 này sẽ đáp ứng cho nhu cầu của người dùng một cách đầy đủ nhất, mang lại những hình ảnh sống động trong cuộc
 sống hàng ngày của bạn','6','33333006','15/03/2017','Thái Lan');
 
 
INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('SONY ALPHA A6000 (ILCE-6000L) KIT 16-50 F3.5-5.6 OSS (ĐEN)','/images/products/789654009-1.jpg','13490000',
'760','250','124','Máy ảnh Sony Alpha A6000 là sự cải tiến vượt bậc của Sony với khoảng thời gian lấy nét chỉ 
trong 0.06s. Ngoài ra, những hình ảnh với dải màu sâu và độ tương phản mềm mại sẽ được tạo ra liên tục với hơn
 600 tấm ảnh chỉ trong một lần sạc pin. Máy được trang bị bộ cảm biến Exmor APS HD CMOS 24.3MP APS-C và bộ
 xử lý hình ảnh BIONZ X có độ phân giải cao rất có lợi để chụp những ảnh khổ lớn chuyên dụng cho thiết kế hay
 những chi tiết dù nhỏ nhất cũng sẽ được ghi lại qua từng điểm ảnh một các rõ nét nhất. Các chip trên ống kính
 lấp đầy những khoảng trống giữa các điểm ảnh lân cận nhằm phù hợp với khả năng tập trung ánh sáng và độ sắc 
 nét.','2','33333009','09/12/2014','Thái Lan');


INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('FUJIFILM X-A3 KIT XC16-50MM F3.5-5.6 OIS II (BẠC)','/images/products/789654010-1.jpg','10390000',
'503','90','54','Vẫn giữ nét đặc trưng hoài cổ của mình nhưng lại được khoác lên những lớp áo mới thời trang hơn, nổi bật hơn, máy ảnh Fujifilm X-A3 Kit XC16-50 OIS II + XC50-230 OIS II (Bạc) 
chính là sản phẩm mới nhất trong phân khúc giá rẻ mà Fujifilm dành cho tất cả mọi người.','4','33333003','30/11/2015','Indonesia');

INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('CANON EOS 5D MARK III BODY','/images/products/789654011-1.jpg','46000000',
'1205','450','223','Chiếc máy ảnh Canon 5D Mark III này có kiểu dáng mềm mại hơn so với máy ảnh 5D Mark 
II, tuy nhiên thiết kế máy lại có phần tròn trịa giống với dòng 7D. Cũng như phần cạnh trái, toàn bộ diện 
tích phần tay cầm bên phải của Canon 5D Mark III được bọc một lớp cao su mềm, nhằm mang lại cảm giác chắc
 chắn cho chiếc body nặng đến 860g này.','3','33333001','25/01/2015','Nhật Bản');
 

INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('CANON EOS 6D KIT EF 24-105 F4L IS USM','/images/products/789654012-1.jpg',
'37090000','750','230','50','Máy ảnh Canon 6D là máy ảnh chuyên nghiệp đầu tiên được tích hợp GPS cũng như kết nối 
WiFi. Không những thế, giá thành rẻ nhưng hiệu năng tiên tiến với bộ xử lý đời mới chắc chắn là sự hoàn hảo không
 đâu có.','3','33333001','25/04/2015','Nhật Bản');

INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('CANON EOS 7D MARK II BODY','/images/products/789654013-1.jpg',
'25800000','3052','700','562','Với một cảm biến APS-C CMOS 20,2 megapixel và bộ vi xử lý hình ảnh kép DIGIC
 6, Máy ảnh Canon 7D Mark II có khả năng tạo độ phân giải cao, chi tiết hình ảnh và video 1080p full HD với
 độ nhạy đáng chú ý và tiếng ồn tối thiểu. Một dải ISO 100-16.000 và hơn nữa được mở rộng theo tiêu chuẩn
 ISO 51200. 7D Mark II rất phù hợp để làm việc trong điều kiện ánh sáng khó khăn và sức mạnh xử lý của bộ 
 vi xử lý DIGIC 6 cũng góp phần nâng cao chất lượng ánh sáng yếu với màu sắc mịn màng, sửa chữa tỷ lệ hao
 hụt âm và quang sai.','3','33333001','05/11/2016','Nhật Bản');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('CANON EOS 80D KIT EF-S 18-135MM F/3.5-5.6 IS USM','/images/products/789654014-1.jpg','26690000','6204','1000','256','Dòng máy ảnh hai số của Canon sau 
 nhiều nghiên cứu và cải tiến đã xuất hiện một sản phẩm mới. Đó là máy ảnh Canon EOS 80D với hệ thống lấy nét 
 tới 45 điểm. Đây cũng là sản phẩm mà hãng muốn hướng tới người dùng nghiệp dư và bán chuyên nghiệp nhằm cạnh 
 tranh trực tiếp với đối thủ D7200 của Nikon.','3','33333001','19/04/2014','Nhật Bản');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('CANON EOS 800D KIT EF S18-135 IS USM','/images/products/789654015-1.jpg','23290000','405','50','12','Canon EOS 800D hay còn gọi với cái tên khác là
 Rebel T7i một DSLR entry-level nhằm mục đích tiếp cận nhiếp ảnh gia muốn một bước lên từ các mô hình
 cơ bản nhất được công bố vào 02/2017.','3','33333001','04/12/2013','Nhật Bản');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('CANON EOS M10 KIT EF-M15-45 (BLACK)','/images/products/789654016-1.jpg',
'6000000','4025','1200','502','EOS M10 là mẫu nhẹ nhất trong dòng EOS nhưng nó thuộc dòng máy ảnh mirrorless Canon .
 Tập trung tối đa vào khả năng hỗ trợ điều khiển và nâng cao chất lượng ảnh nên nó đã nhận được nhiều chú
 ý của giới công nghệ.','2','33333001','12/07/2015','Nhật Bản');
 
  INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('CANON POWERSHOT G3 X','/images/products/789654017-1.jpg','17090000','1203','450',
'120','Đây là một sản phẩm trong bộ ba của Canon bao gồm G3 X, G5 X và G9 X. Nhưng khác với hai người
 đồng cấp, nếu Canon Poweshort G5 X độ zoom chỉ 4,2x hay G9 X chỉ có 3x, thì máy ảnh Canon Pwershort
 G3 X có zoom quang học lên tới 25x. Đối với nhiều máy ảnh compact, đây là một đối thủ nặng ký thật sự.',
 '5','33333001','14/04/2014','Nhật Bản');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('CANON POWERSHOT SX430 IS','/images/products/789654018-1.jpg','5350000',
'421','120','102','Máy ảnh Compact Canon SX430 IS là một máy ảnh 20.0 megapixel phù hợp cho những
 chuyến đi du lịch với khả năng zoom quang học 45x, cho bạn khả năng chụp cận cảnh ấn tượng. 
 Báng pin dạng công thái học cũng giúp thao tác tốt hơn, đặc biệt hữu dụng để ghi video và đảm bảo 
 hình ảnh ổn định. Với tính năng Wi-Fi/NFC tích hợp, việc chia sẻ hình ảnh trên mạng xã hội chưa bao
 giờ đơn giản đến thế.','3','33333001','24/09/2012','Trung Quốc');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('Camera IP Wifi Dahua 1.3Mp IPC-C15P','/images/products/789654019-1.jpg','960000','203','50','43',
'ng kính cố định 2,3mm cho góc rộng lên đến 125 độ, tích hợp míc và loa với chuẩn âm thanh G.711a / G.711u
 / PCM , đàm thoại hai chiều, hỗ trợ khe cắm thẻ nhớ Micro SD, Max 128GB, tích hợp Wi-Fi(IEEE802.11b/g/n)
 hỗ trợ P2P,chuẩn tương thích ONVIF, điện áp DC5V 1A , công suất <4,5W, chất liệu vỏ plastic, môi trường
 làm việc từ -30°C~+60°C, kích thước 76mm*65mm*107mm, trọng lượng 0.14KG','6','33333002','22/02/2014','Trung Quốc');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('Camera IP Wifi Dahua 1.3Mp IPC-HFW1120SP-W','/images/products/789654020-1.jpg','1390000','458','120',
'4','Camera IP Wifi Dahua 1.3Mp IPC-HFW1120SP-W có vỏ ngoài được làm từ kim loại bền bỉ, kích thước Φ70 mm 
x 16 5mmnhỏ gọn, bạn có thể dễ dàng đặt camera tại văn phòng, nhà ở hoặc cửa hàng để quản lý, quan sát
 một cách hiệu quả. Sản phẩm với thiết kế hiện đại và đạt chuẩn chống nước IP66, mang đến thời gian sử
 dụng lâu dài, hạn chế việc đổi mới gây tốn kém.','6','33333002','28/04/2014','Trung Quốc');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('Camera IP Wifi Dahua 1.3Mp IPC-A15P','/images/products/789654021-1.jpg','1690000','652','150','54',
'Camera Dahua DH-IPC-A15P thiết kế chắc chắn, nhỏ gọn, thẩm mỹ cao với nhiều tính năng công nghệ hồng ngoại
 thông minh, phù hợp sử dụng cho gia đình, văn phòng, cửa hàng. Với thế mạnh là dòng camera ip không dây 
 "Home-use Series" của DAHUA, cho chất lượng hình ảnh nổi bật với độ phân giải cao (1.3 megapixel),
 hỗ trợ míc và loa, đàm thoại 2 chiều, quan sát ngày đêm tốt trong khoảng cách 10 mét. Đặc biệt, 
 sản phẩm này còn hỗ trợ khả năng quay quét ngang (PAN)  355° tốc độ 100° /s, quay dọc lên xuống 
 90° 100° /s, hỗ trợ cài đặt trước 25 điểm, 8 hành trình (Tour).','6','33333002','20/07/2014','Trung Quốc');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('MÁY ẢNH FUJIFILM FINEPIX XP120 (ĐEN VIỀN XANH NGỌC)','/images/products/789654022-1.jpg',
'5090000','1642','650','185','So với thế hệ trước, máy ảnh Fujifilm FinePix XP120 hoàn toàn vượt trội về độ 
bền cũng như khả năng hoạt động trong mọi điều kiện thời tiết. Lớp vỏ cứng cáp và sự kín kẽ cũng như cấu 
trúc bền bỉ cho phép máy có thể “lặn” dưới nước tới độ sâu 20 mét, chống sốc khi rơi từ độ cao 1,7 mét.
 Người dùng cũng hoàn toàn yên tâm bởi những môi trường khác nghiệt như băng tuyết hay đầy bụi bẩn 
 và nằng gió thì máy cũng hoạt động một cách hoàn hảo nhất.','6','33333003','22/11/2015','Trung Quốc');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('FUJIFILM FINEPIX XP120 (VÀNG)','/images/products/789654023-1.jpg','5090000',
'2368','450','204','So với thế hệ trước, máy ảnh Fujifilm FinePix XP120 hoàn toàn vượt trội về độ bền
 cũng như khả năng hoạt động trong mọi điều kiện thời tiết. Lớp vỏ cứng cáp và sự kín kẽ cũng như cấu
 trúc bền bỉ cho phép máy có thể “lặn” dưới nước tới độ sâu 20 mét, chống sốc khi rơi từ độ cao 1,7
 mét. Người dùng cũng hoàn toàn yên tâm bởi những môi trường khác nghiệt như băng tuyết hay đầy bụi
 bẩn và nằng gió thì máy cũng hoạt động một cách hoàn hảo nhất.','4','33333003','02/10/2015','Trung Quốc');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('MÁY ẢNH FUJIFILM INSTAX MINI 9 (HỒNG)','/images/products/789654024-1.jpg','1990000',
'154','120','14','Fujifilm instax mini 9 là chiếc máy ảnh nhỏ gọn, lý tưởng để chụp selfie và in ảnh độc
 đáo, ấn tượng với kích thước tương đương chiếc thẻ tín dụng. Với kiểu dáng đẹp, nhiều màu sắc kết hợp 
 với ống kính fujinon 60mm F/12, cung cấp khả năng lấy nét từ 2inch đến vô cùng. Đặc biệt chiếc gương
 nhỏ gần ống kính giúp người dùng kiểm tra khung hình đã phù hợp chưa khi chụp selfie. Với chế độ mới 
 "High-key" sẽ tự động chỉnh sáng, vì thế hình ảnh chụp sẽ sắc nét và sáng sủa hơn. Instax Mini 9 sở 
 hữu ống kính close-up giúp bạn có thể chụp các hình ảnh trong khoảng cách 35,5 cm.','6','33333003','14/12/2014','Trung Quốc');
 
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('FUJIFILM X-T20 KIT XF18-55 F2.8-4 R LM OIS (ĐEN)','/images/products/789654025-1.jpg',
'27990000','4572','650','352','Máy ảnh Fujifilm X-T20 vẫn được trau chuốt theo kiểu thiết kế hoài 
cổ thường thấy. Xét về ngoại hình thì sản phẩm giống hệt với X-T10 trước đây. Tuy nhiên, lớp vỏ được 
chế tạo bằng hợp kim magie bền bỉ và chắc chắn hơn. Hệ thống nút bấm bố trí khá hợp lý với các 
núm xoay điều chỉnh tốc độ, cộng trừ EV và các chế độ ở mặt trên. Mặt sau của máy vẫn là các nút 
tùy chỉnh thường thấy.','3','33333003','02/06/2016','Asia');

 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('GoPro Hero','/images/products/789654026-1.jpg','52000000','240','40','12','GoPro HERO là sản phẩm 
bình dân và là một camera hành động truyền thống với thiết kế nhỏ gọn quen thuộc của “gia đình” HERO, 
đây cũng là bản “rút gọn” của HERO6 trước đó.','6','33333004','22/07/2017','Mỹ');

 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('GoPro Hero6','/images/products/789654027-1.jpg','9090000','542','60','4','Nhắc đến GoPro Hero 6 là 
phải nhắc đến chế độ hỗ trợ quay 4K 60fps được cho là có chất lượng hình ảnh cao hơn, hoạt động nhanh hơn
 so với thế hệ trước. Khi sử dụng tính năng này, các video sẽ được nén dưới dạng H.265 (HEVC), thay cho
 H.264 để tiết kiệm dung lượng. Vì vậy, hãy nhanh chóng cập nhật lên những phiên bản chỉnh sửa video mới 
 nhất như Adobe Premier để trải nghiệm những thước phim hấp dẫn.','6','33333004','05/01/2018','Mỹ');
 
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('Webcam Logitech Conference PTZ Pro Camera','/images/products/789654028-1.jpg','17990000','523','250',
'145','Webcam Logitech Conference PTZ Pro Camera là thiết bị camera hội nghị chất lượng cao với nhiều tính năng
 ưu việt nhằm mang lại những trải nghiệm tốt nhất cho người sử dụng.','6','33333005','03/11/2015','Trung Quốc');
 
  INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('Webcam Logitech C922 Optimized For Streaming (New)','/images/products/789654029-1.jpg','2690000',
'527','100','44','Webcam Logitech C922 Optimized For Streaming (New) là phiên bản hiện đại được nâng cấp
 từ người tiền nhiệm C920. Chiếc Webcam C922 này thể quay phim rõ nét 1080p hoặc 720p ở tốc độ 60 fps. 
 Bên cạnh đó sản phẩm cũng được trang bị phần mềm Chromacam tự động xóa background để giúp các Youtuber 
 hoặc Game thủ livestream tốt hơn.','6','33333005','27/06/2015','Trung Quốc');
 
   INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('Webcam Logitech C310 (HD)','/images/products/789654030-1.jpg','746000','723','250','55',
'Webcam Logitech C310 (HD) sẽ giúp bạn kết nối với bạn bè người thân ở gần nhau hơn mặc dù địa lý rất xa.
 Với độ phân giải camera lên đến 3.0MP mang lại những hình ảnh rõ nét với màu sắc sinh động, với âm thanh 
 sống động nhờ công nghệ lọc âm tiên tiến.','6','33333005','18/10/2016','Trung Quốc');


INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('Webcam Logitech C615 (HD) ','/images/products/789654031-1.jpg','1459000','584','120','51',
'Webcam Logitech C615 (HD) sẽ giúp bạn tạo ấn tượng với những người xung quanh. Những hình ảnh long 
lanh cùng giọng nói chân thực là những gì mà  C615 mang đến cho bạn. Ngoài ra, thiết bị có thể  đính
 kèm chân máy Tripod giúp bạn quay nhiều góc độ khác nhau.','6','33333005','21/08/2017','Trung Quốc');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('NIKON COOLPIX B700','/images/products/789654032-1.jpg','8490000','1206','350','243',
'Tại PC+ 2016, Nikon đã tung ra ba sản phẩm mới mà máy ảnh Nikon Coopix B700 là một trong số đó. Thông
 tin chính thức là dòng serie B sẽ thay thế hoàn toàn cho dòng serie P vốn có từ trước tới nay. Vẫn trung
 thành với thiết kế mượt mà nhưng thân thiện với người dùng, chiếc Nikon Coolpix B700 không có nét 
 hầm hố mà chỉ là những đường nét hao hao giống với các DSLR tầm thấp với phần bán tay cầm to và nhô 
 ra rất thuận lợi cho việc cầm nắm khi chụp ảnh. Bề mặt trơn nhẵn không sần sùi.','6','33333006','22/05/2017','Trung Quốc');
 
  INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('NIKON D3400 KIT AF-P 18-55 VR','/images/products/789654033-1.jpg','9790000','3260','620','427',
'Máy ảnh Nikon D3400 là máy ảnh mà hãng Nikon vừa ra mắt người dùng. Đây có thể xem là chiếc máy ảnh 
dành cho những người mới bước chân vào lĩnh vực nhiếp ảnh. Được trang bị nhiều tính năng mới, Nikon
 D3400 sẽ giữ lại cho bạn những khoảnh khắc khó quên trong cuộc sống hàng ngày.','3','33333006','29/01/2017','Thái Lan');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('OLYMPUS E-M5 MARK II BODY (BLACK)','/images/products/789654034-1.jpg','23500000','1902',
'600','523','Olympus E-M5 Mark II là phiên bản tiếp theo của chiếc Mirrorless Olympus E-M5 đời đầu. Sản phẩm 
mới được kỳ vọng sẽ hoàn thiện những thiếu sót của đàn anh để trở thành mẫu máy ảnh bán chạy nhất của Olympus
 trong thời gian sắp tới.','6','33333007','13/04/2015','Việt Nam');

 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('MÁY ẢNH DSLR PENTAX K-1 II','/images/products/789654035-1.jpg','46900000','279','50','5',
'Giàu màu sắc, đa sắc thái, bokeh đẹp cùng cảm giác biểu hiện sâu sắc được xác định rất rõ. Khi cảm hứng 
của nhiếp ảnh gia được phản ánh thực sự trong tất cả các yếu tố trên, hình ảnh thu được có thể nói lên nhiều
 điều chứ không đơn thuần chỉ là những bản ghi chép lại – chúng sẽ là những tác phẩm nghệ thuật thực sự ấn
 tượng. Pentax K-1 II được thiết kế như là mẫu máy ảnh hàng đầu đề hoàn thành mục tiêu này. Nó có một bộ xử
 lý ảnh mới, cao cấp hơn để mang lại hình ảnh đẹp mà mọi nhiếp ảnh gia yêu cầu.','6','33333008','30/11/2013','Trung Quốc');
 
  INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('MÁY ẢNH PENTAX K-3 II BODY','/images/products/789654036-1.jpg','25900000','798','170','65',
'Máy ảnh Pentax K3-II -chiếc máy ảnh DSLR này thuộc dòng Semi-Pro với cảm biến APS-C 24MP mới. được
 tích hợp nhiều công nghệ mới nhất của hãng Pentax, hứa hẹn sẽ mang đến cho người sử dùng nhiều trải nghiệm mới mẻ.',
 '6','33333008','21/03/2018','Asia');
 
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('MÁY ẢNH PENTAX RICOH WG-5 GPS (CAM)','/images/products/789654037-1.jpg','7490000','1982','350',
'124','Ricoh WG-5 GPS là chiếc máy ảnh chụp hình dưới nước Pentax siêu bền được sản xuất nhằm đáp ứng 
cho những nhu cầu chụp ảnh đặc biệt như lặn dưới nước, trong môi trường bụi bặm. Với thiết kế mạnh mẽ,
 cùng khả năng chống chịu tuyệt vời sẽ mang lại những hình ảnh thú vị mà bạn muốn chia sẽ cùng mọi người.',
 '4','33333008','02/07/2016','Asia');

 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('MÁY ẢNH PENTAX K-3 II SILVER EDITION (BODY)','/images/products/789654038-1.jpg','20790000','395',
'74','15','Máy ảnh Pentax K3-II -chiếc máy ảnh DSLR này thuộc dòng Semi-Pro với cảm biến APS-C 24MP mới.
được tích hợp nhiều công nghệ mới nhất của hãng Pentax, hứa hẹn sẽ mang đến cho người sử dùng nhiều trải 
nghiệm mới mẻ.','6','33333008','23/06/2013','Asia');

  
  
 INSERT INTO sanpham (Ten,HinhAnh,GiaBan,SoLuotXem,SoLuongTon,SoLuongBan,MoTa,Loai,NhaSanXuat,NgayTiepNhan,XuatXu)
VALUES ('MÁY ẢNH SONY CYBERSHOT DSC W830 (ĐEN)','/images/products/789654039-1.jpg','2550000','752','150','92',
'Máy ảnh Sony DSC-W830 là một máy ảnh nhỏ gọn với 20.1MP , 1/2.3 " Super HAD CCD cảm biến hình ảnh và bộ xử lý BIONZ
 cho độ phân giải hình ảnh cao nhất với HD 1280 x 720 quay video 30 fps , và sự nhạy cảm ánh sáng tiêu chuẩn ISO 3200
 . các zoom quang 8x, 4,5 -36mm , ống kính Carl Zeiss Vario-Tessar cung cấp một loạt 35mm tương đương tiêu cự 25 -200mm
 , bao gồm góc và một loạt các khẩu độ f/3.3-6.3','1','33333009','04/12/2017','Trung Quốc');
  
  

 
INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456002','789654002','1');
 
INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456007','789654004','1');
 
INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456005','789654011','2');
-- bo sung donhang 
INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111001','29/8/2017','10390000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111003','05/05/2016','2600000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111003','12/03/2018','2350000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111002','30/11/2017','15900000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111002','30/11/2017','13490000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111001','25/12/2017','46000000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111003','08/09/2015','25800000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111002','14/02/2016','6000000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111002','28/07/2016','9790000','1','0');

INSERT INTO donhang (KhachHang,ThoiGian,TongTien,TrangThai, DangGiao) VALUES 
('11111001','13/04/2016','7490000','1','0');

-- bo sung sp_dh

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456002','789654001','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456003','789654003','2');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456002','789654004','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456004','789654005','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456004','789654006','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456002','789654007','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456005','789654008','3');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456005','789654009','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456005','789654010','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456006','789654011','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456006','789654012','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456006','789654013','2');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456007','789654014','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456008','789654015','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456008','789654012','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456009','789654016','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456010','789654017','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456010','789654018','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456011','789654018','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456012','789654019','2');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456013','789654019','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456014','789654020','2');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456015','789654021','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456015','789654022','3');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456016','789654017','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456017','789654023','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456017','789654024','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456016','789654025','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456015','789654026','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456015','789654027','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456014','789654028','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456013','789654029','4');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456013','789654030','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456012','789654031','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456011','789654031','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456011','789654032','3');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456010','789654033','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456010','789654034','2');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456009','789654035','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456006','789654036','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456004','789654037','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456003','789654038','1');

INSERT INTO sp_dh (DonHang,SanPham,SoLuong) VALUES ('123456002','789654039','1');