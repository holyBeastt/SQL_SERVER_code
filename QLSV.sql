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
select MonHoc.MaMH, TenMH, Diem 
from MonHoc join KETQUA on MONHOC.MaMH=KetQua.MaMH
			join SINHVIEN on SINHVIEN.MaSV = KetQua.MaSV
where TenSV like N'%Thức'


-- 2.Cho biết mã môn học, tên môn và điểm thi ở những môn mà sinh viên tên Dung phải thi lại (điểm<5)
select MonHoc.MaMH, TenMH, Diem 
from MONHOC join KETQUA on MONHOC.MaMH = KETQUA.MaMH
where Diem<5 and MaSV = (select MaSV from sinhvien where TenSV like N'%Dung')

-- 3.Cho biết mã sinh viên, tên những sinh viên đã thi ít nhất là 1 trong 3 môn Lý thuyết Cơ sở dữ liệu, Tin học đại cương, mạng máy tính.
select MaSV, TenSV 
from SINHVIEN 
where MaSV in (select distinct MaSV from KETQUA where Diem is not null)

-- 4. Cho biết mã môn học, tên môn mà sinh viên có mã số 1 chưa có điểm

	(select MaMH from MONHOC 
	except
	select MaMH from KETQUA where MaSV=3)

-- 5. Cho biết điểm cao nhất môn 1 mà các sinh viên đạt được
select max(Diem) as 'Max Diem' from KETQUA where MaMH=1

-- 6. Cho biết mã sinh viên, tên những sinh viên có điểm thi môn 2 không thấp nhất khoa
select MaSV, TenSV from SINHVIEN where MaSV in
	(select MaSV from KETQUA where Diem >
	-- Tìm điểm thi môn 2 thấp nhất khoa
		(select min(Diem) from KETQUA where MaMH=2) and MaMH=2)

-- 7. Cho biết mã sinh viên và tên những sinh viên có điểm thi môn 1 lớn hơn điểm thi môn 1 của sinh viên có mã số 3
select MaSV, TenSV from SINHVIEN where MaSV in 
	-- Tìm Mã sinh viên của những sv có điểm thi môn 1 lớn hơn ...
	(select MaSV from KETQUA where MaMH=1 and Diem>
	-- Tìm điểm thi môn 1 của sv có mã số 3
		(select Diem from KETQUA where MaSV=3 and MaMH=1))

-- 8. Cho biết số sinh viên phải thi lại môn Toán Cao cấp 
select count(MaSV) as 'Số lượng sv thi lại' from Ketqua where Diem<4 and MaMH=
	-- Tìm MaMH môn Toán Cao Cấp
	(select MaMH from MONHOC where TenMH like N'Toán Cao Cấp')

-- 9. Đối với mỗi môn, cho biết tên môn và số sinh viên phải thi lại môn đó mà số sinh viên thi lại >=2
select MaMH, count(Diem)as N'Số sinh viên thi lại' from Ketqua 
where Diem<4
group by MaMH
having count(Diem) > 1

-- 10. Cho biết mã sinh viên, tên và lớp của sinh viên đạt điểm cao nhất môn Tin đại cương
select SinhVien.MaSV, TenSV, Lop from SINHVIEN join KETQUA on SINHVIEN.MaSV=KETQUA.MaSV
where Diem=
	-- Tìm điểm cao nhất tin đại cương
	(select MAX(Diem) from KETQUA 
	where MaMH = (select MaMH from MONHOC
					where TenMH like N'Tin đại cương'))

-- 11. Đối với mỗi lớp, lập bảng điểm gồm mã sinh viên, tên sinh viên và điểm trung bình chung học tập. 
select KETQUA.MaSV, TenSV, AVG(Diem) as N'Điểm trung bình' 
from SINHVIEN join KETQUA on SINHVIEN.MaSV = KETQUA.MaSV
group by KETQUA.MaSV, TenSV

--12. Đối với mỗi lớp, cho biết mã sinh viên và tên những sinh viên phải thi lại từ 2 môn trở lên
select SinhVien.MaSV, TenSV, count(Diem) as N'Số môn thi lại' 
from KETQUA join SINHVIEN on KETQUA.MaSV=SINHVIEN.MaSV
where Diem<4
group by SinhVien.MaSV, TenSV
having count(Diem)>=2

-- 13. Cho biết mã số và tên của những sinh viên tham gia thi tất cả các môn.
select KETQUA.MaSV, TenSV from SINHVIEN
join KETQUA on SINHVIEN.MaSV=KETQUA.MaSV
group by KETQUA.MaSV, TenSV
having count(Diem)>2

-- 14. Cho biết mã sinh viên và tên của sinh viên có điểm trung bình chung học tập >=6
select KETQUA.MaSV, TenSV from SINHVIEN
join KETQUA on SINHVIEN.MaSV=KETQUA.MaSV
group by KETQUA.MaSV, TenSV
having AVG(Diem)>=6

-- 15. Cho biết mã sinh viên và tên những sinh viên phải thi lại ở ít nhất là những môn mà sinh viên có mã số 3 phải thi lại
/* select KETQUA.MaSV, TenSV from KETQUA

	-- Những môn sinh viên có mã số 3 phải thi lại
	(select MaSV from KETQUA where MaSV=3 and Diem<4) */

-- 16. Cho mã sv và tên của những sinh viên có hơn nửa số điểm  >=5. 


-- 17. Cho danh sách tên và mã sinh viên có điểm trung bình chung lớn hơn điểm trung bình của toàn khóa
select MaSV, TenSV from SINHVIEN 

-- 18. Cho danh sách mã sinh viên, tên sinh viên có điểm cao nhất của mỗi lớp
select MaSV, TenSV from SINHVIEN

select max(Diem) from KETQUA



-- 19. Cho danh sách tên và mã sinh viên có điểm trung bình chung lớn hơn điểm trung bình của lớp sinh viên đó theo học.



