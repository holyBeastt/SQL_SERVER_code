CREATE DATABASE QLSV
USE QLSV

CREATE TABLE SINHVIEN
(
	MaSV int identity,
	TenSV nvarchar(50) not null,
	GioiTinh nvarchar(10) default 'Nam',
	NgaySinh date check (NgaySinh < getdate()),
	Que nvarchar(10) not null,
	Lop varchar(10)
)

CREATE TABLE MONHOC
(
	MaMH int identity,
	TenMH nvarchar(20) unique,
	DVHT int check (DVHT between 2 and 9)
)

CREATE TABLE KETQUA
(
	MaSV int not null,
	MaMH int not null,
	Diem float check (Diem between 0 and 10)
)

-- CREATE PRIMARY KEY
ALTER TABLE SINHVIEN
	ADD CONSTRAINT PK_MaSV
	PRIMARY KEY (MaSV)

ALTER TABLE MONHOC
	ADD CONSTRAINT PK_MaMH
	PRIMARY KEY (MaMH)

ALTER TABLE KETQUA 
	ADD CONSTRAINT PK_KETQUA
	PRIMARY KEY (MaSV, MaMH)

-- CREATE FOREIGN KEY
ALTER TABLE KETQUA
	ADD CONSTRAINT FR_MaSV
	FOREIGN KEY (MaSV)
	REFERENCES SINHVIEN(MaSV)

ALTER TABLE KETQUA
	ADD CONSTRAINT FR_MaMH
	FOREIGN KEY (MaMH)
	REFERENCES MONHOC(MaMH)

-- ADD DATA
INSERT INTO SINHVIEN(TenSV,  GioiTinh, NgaySinh, Que, Lop) VALUES
(N'Trần Bảo Trọng', N'Nam', '1995-12-14', N'Hà Giang', 'L02'),
(N'Lê Thùy Duong', N'Nữ', '1997-05-12', N'Hà Nội', 'L03'),
(N'Trần Phương Thảo', N'Nam', '1996-03-30', N'Quảng Ninh', 'L01'),
(N'Lê Trường An', N'Nam', '1995-11-20', N'Ninh Bình', 'L04'),
(N'Phạm Thị Hương Giang', N'Nữ', '1999-02-21', N'Hòa Bình', 'L02'),
(N'Trần Anh Bảo', N'Nam', '1995-12-14', N'Hà Giang', 'L02'),
(N'Lê Thùy Dung', N'Nữ', '1997-05-12', N'Hà Nội', 'L03'),
(N'Phạm Trung Tính', N'Nam', '1996-03-30', N'Quảng Ninh', 'L01'),
(N'Lê An Hải', N'Nam', '1995-11-20', N'Ninh Bình', 'L04'),
(N'Phạm Thị Giang Hương', N'Nữ', '1999-02-21', N'Hòa Bình', 'L02'),
(N'Đoàn Duy Thức', N'Nam', '1994-04-12', N'Hà Nội', 'L01'),
(N'Dương Tuấn Thông', N'Nam', '1991-04-12', N'Nam Định', 'L03'),
(N'Lê Thành Đạt', N'Nam', '1993-04-15', N'Phú Thọ', 'L04'),
(N'Nguyễn Hằng Nga', N'Nữ', '1993-05-25', N'Hà Nội', 'L01'),
(N'Trần Thanh Nga', N'Nữ', '1994-06-20', N'Phú Thọ', 'L03'),
(N'Trần Trọng Hoàng', N'Nam', '1995-12-14', N'Hà Giang', 'L02'),
(N'Nguyễn Mai Hoa', N'Nữ', '1997-05-12', N'Hà Nội', 'L03'),
(N'Lê Thúy An', N'Nam', '1998-03-23', N'Hà Nội', 'L01')

INSERT INTO MONHOC(TenMH, DVHT) VALUES
(N'Toán cao cấp', 3),
(N'Mạng máy tính', 3),
(N'Tin đại cương', 4)

INSERT INTO KETQUA(MaSV, MaMH, Diem) VALUES
(1,1,8),
(1,2,5),
(1,3,7),
(2,1,9),
(2,2,5),
(2,3,2),
(3,1,4),
(3,2,2),
(4,1,1),
(4,2,3),
(5,1,4),
(6,1,2),
(6,2,7),
(6,3,9),
(7,1,4),
(7,2,5),
(7,3,8),
(8,1,9),
(8,2,8),
(9,1,7),
(9,2,7),
(9,3,5),
(10,1,3),
(10,3,6),
(11,1,6),
(12,1,8),
(12,2,7),
(12,3,5),
(13,1,6),
(13,2,5),
(13,3,5),
(14,1,8),
(14,2,9),
(14,3,7),
(15,1,3),
(15,2,6),
(15,3,4),
(16,1,NULL)

-- DATA QUERY
-- 1.Cho biết mã môn học, tên môn học,  điểm thi  tất cả các môn của sinh viên tên Thức
SELECT MaMH, TenMH, Diem FROM MONHOC * KETQUA

