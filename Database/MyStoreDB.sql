-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mystoredb
-- ------------------------------------------------------
-- Server version	5.7.21-log

--
-- Table structure for table `khachhang`
--

CREATE SCHEMA `mystoredb` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;

USE `mystoredb`;

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE `khachhang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `DiaChi` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `SDT` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TenDangNhap` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MatKhau` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GioiTinh` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `khachhang` AUTO_INCREMENT=11111001;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
CREATE TABLE `donhang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KhachHang` int(11) DEFAULT NULL,
  `ThoiGian` date DEFAULT NULL,
  `TongTien` float DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `nhasanxuat`
--

DROP TABLE IF EXISTS `nhasanxuat`;
CREATE TABLE `nhasanxuat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TenNSX` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
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
  `NgayTiepNhan` date DEFAULT NULL,
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


