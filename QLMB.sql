CREATE DATABASE QLMB
USE QLMB


-- CREATE TABLE
CREATE TABLE CHUYENBAY
(
	MaCB char(5) not null,
	GaDi varchar(50),
	GaDen varchar(50),
	DoDai int,
	GioDi time,
	GioDen time,
	ChiPhi int,
)

CREATE TABLE MAYBAY
(
	MaMB int not null,
	Hieu varchar(50),
	TamBay int,
)

CREATE TABLE NHANVIEN
(
	MaNV char(9) not null,
	Ten varchar(50),
	Luong int,
)

CREATE TABLE CHUNGNHAN
(
	MaNV char(9) not null,
	MaMB int not null,
)

-- ADD PRIMARY KEY
ALTER TABLE CHUYENBAY
	ADD CONSTRAINT PK_MaCB
	PRIMARY KEY (MaCB)

ALTER TABLE MAYBAY
	ADD CONSTRAINT PK_MaMB
	PRIMARY KEY (MaMB)

ALTER TABLE NHANVIEN
	ADD CONSTRAINT PK_MaNV
	PRIMARY KEY (MaNV)

ALTER TABLE CHUNGNHAN
	ADD CONSTRAINT PK_CHUNGNHAN
	PRIMARY KEY (MaNV, MaMB)

-- ADD FOREIGN KEY
ALTER TABLE CHUNGNHAN
	ADD CONSTRAINT FR_MaNV
	FOREIGN KEY (MaNV)
	REFERENCES NHANVIEN(MaNV)

ALTER TABLE CHUNGNHAN
	ADD CONSTRAINT FR_MaMB
	FOREIGN KEY (MaMB)
	REFERENCES MAYBAY(MaMB)

-- ADD DATA
INSERT INTO NHANVIEN(MaNV, Ten, Luong) VALUES 
(242518965, 'Tran Van Son', 120433),
(141582651, 'Doan Thi Mai', 178345),
(011564812, 'Ton Van Quy', 153972),
(567354612, 'Quan Cam Ly', 256481),
(552455318, 'La Que', 101745),
(550156548, 'Nguyen Thi Cam', 205187),
(390487451, 'Le Van Luat', 212156),
(274878974, 'Mai Quoc Minh', 99890),
(254099823, 'Nguyen Thi Quynh', 24450),
(356187925, 'Nguyen Vinh Bao', 44740),
(355548984, 'Tran Thi Hoai An', 212156),
(310454876, 'Ta Van Do', 212156),
(489456522, 'Nguyen Thi Quy Linh', 127984),
(489221823, 'Bui Quoc Chinh', 23980),
(548977562, 'Le Van Quy', 84476),
(310454877, 'Tran Van Hao', 33546),
(142519864, 'Nguyen Thi Xuan Dao', 227489),
(269734834, 'Truong Tuan Anh', 289950),
(287321212, 'Duong Van Minh', 48090),
(552455348, 'Bui Thi Dung', 92013),
(248965255, 'Tran Thi Ba', 43723),
(159542516, 'Le Van Ky', 48250) ,
(348121549, 'Nguyen Van Thanh', 32899),
(574489457, 'Bui Van Lap', 20)

INSERT INTO MAYBAY(MaMB, Hieu, TamBay) VALUES 
(747, 'Boeing 747 - 400', 13488),
(737, 'Boeing 737 - 800', 5413),
(340, 'Airbus A340 - 300', 11392),
(757, 'Boeing 757 - 300', 6416),
(777, 'Boeing 777 - 300', 10306),
(767, 'Boeing 767 - 400ER', 10360),
(320, 'Airbus A320', 4168), 
(319, 'Airbus A319', 2888),
(727, 'Boeing 727', 2406),
(154, 'Tupolev 154', 6565)


INSERT INTO CHUNGNHAN(MaNV, MaMB) VALUES 
(567354612, 747),
(567354612, 737),
(567354612, 757),
(567354612, 777),
(567354612, 767),
(567354612, 727),
(567354612, 340),
(552455318, 737),
(552455318, 319),
(552455318, 747),
(552455318, 767),
(390487451, 340),
(390487451, 320),
(390487451, 319),
(274878974, 757),
(274878974, 767), 
(355548984, 154), 
(310454876, 154),
(142519864, 747),
(142519864, 757),
(142519864, 777), 
(142519864, 767),
(142519864, 737),
(142519864, 340),
(142519864, 320),
(269734834, 747),
(269734834, 737),
(269734834, 340),
(269734834, 757),
(269734834, 777),
(269734834, 767),
(269734834, 319),
(269734834, 727),
(269734834, 154),
(242518965, 737),
(242518965, 757),
(141582651, 737),
(141582651, 757),
(141582651, 767)
select * from nhanvien

INSERT INTO CHUYENBAY(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi)VALUES 
('VN431', 'SGN', 'CAH', 3693, '05:55', '06:55', 236),
('VN320', 'SGN', 'DAD', 2798, '06:00', '07:10', 221),
('VN464', 'SGN', 'DLI', 2002, '07:22', '08:05', 225),
('VN216', 'SGN', 'DIN', 4170, '10:30', '14:20', 262),
('VN280', 'SGN', 'HPH', 11979, '06:00', '08:00', 1279),
('VN254', 'SGN', 'HUI', 4081, '18:40', '20:00', 781),
('VN338', 'SGN', 'BMV', 4081, '15:25', '16:25', 375),
('VN440', 'DAD', 'SGN', 4081, '18:30', '19:30', 426),
('VN651', 'DAD', 'SGN', 2798, '19:30', '08:00', 221),
('VN276', 'DAD', 'CXR', 1283, '09:00', '12:00', 203),
('VN374', 'HAN', 'VII', 510, '11:40', '13:25', 120),
('VN375', 'VII', 'CXR', 752, '14:15', '16:00', 181),
('VN269', 'HAN', 'CXR', 1262, '14:10', '15:50', 202),
('VN315', 'HAN', 'DAD', 134, '11:45', '13:00', 112), 
('VN317', 'HAN', 'UIH', 827, '15:00', '16:15', 190),
('VN741', 'HAN', 'PXU', 395, '06:30', '08:30', 120),
('VN474', 'PXU', 'PQC', 1586, '08:40', '11:20', 102),
('VN476', 'UIH', 'PQC', 485, '09:15', '11:50', 117)


-- query
-- 1. Cho biết thông tin về các chuyến bat đi Đà Lạt (DAD)
select * from CHUYENBAY where GaDen like 'DAD'

-- 2. Cho biết thông tin về các loại máy bay có tầm bay lớn hơn 10.000 km
select * from MAYBAY where TamBay>10000

-- 3. Cho biết thông tin về các nhân viên có lương nhỏ hơn 10000
select * from NHANVIEN where Luong<10000

-- 4. Cho biết thông tin về các chuyến bay có độ dài đường bay nhỏ hơn 10000km và lớn hơn 8000km
select * from CHUYENBAY where DoDai between 8000 and 10000

-- 5. Cho biết thông tin về các chuyến bay xuất phát từ Sài Gòn (SGN) đi Ban Mê Thuột (BMV)
select * from CHUYENBAY where GaDi like 'SGN' and GaDen like 'BMV'

-- 6. Có bao nhiêu chuyến bay xuất phát từ Sài Gòn (SGN)
select count(MaCB) as N'Số lượng' from CHUYENBAY where GaDi like 'SGN'

-- 7. Có bao nhiêu loại máy bay Boeing
select count(*) from MAYBAY where Hieu like 'Boeing%'

-- 8. Cho biết tổng số lương phải trả cho các nhân viên
select SUM(Luong) as N'Tổng số lương' from NHANVIEN

-- 9. Cho biết mã số và tên của các phi công lái máy bay Boeing
select distinct NhanVien.MaNV, Ten from NHANVIEN join CHUNGNHAN on NHANVIEN.MaNV=CHUNGNHAN.MaNV
							   join MAYBAY on MAYBAY.MaMB=CHUNGNHAN.MaMB
where Hieu like 'Boeing%'

-- 10. Cho biết mã số và tên của các phi công có thể lái được máy bay có mã số là 747
select NhanVien.MaNV, Ten from NHANVIEN join CHUNGNHAN on NHANVIEN.MaNV=CHUNGNHAN.MaNV
							   join MAYBAY on CHUNGNHAN.MaMB=MAYBAY.MaMB
where Hieu like N'%747%'

-- 11. Cho biết mã số của các loại máy bay mà nhân viên có họ Nguyễn có thể lái
select Hieu from MAYBAY join CHUNGNHAN on MAYBAY.MaMB=CHUNGNHAN.MaMB
						join NHANVIEN on MAYBAY.MaMB=CHUNGNHAN.MaMB
where Ten like N'Nguyễn%'

-- 12. Cho biết mã số của các phi công vừa lái được Boeing vừa lại được Airbus A320
select NhanVien.MaNV, Ten from MAYBAY join CHUNGNHAN on MAYBAY.MaMB=CHUNGNHAN.MaMB
						join NHANVIEN on MAYBAY.MaMB=CHUNGNHAN.MaMB
where Hieu like 'Boeing%' and Hieu like 'Airbus A320%'

-- 13. Cho biết các loại máy bay có thể thực hiện được chuyến bat VN280
select * from MAYBAY
where TamBay > (select DoDai from CHUYENBAY where MaCB like 'VN280')

-- 14. Cho biết các chuyến bay có thể thực hiện bởi máy bay Airbus A320
select * from CHUYENBAY
where DoDai < (select TamBay from maybay where Hieu like 'Airbus A320')

-- 15. Cho biết tên của các phi công lái máy bay Boeing
select distinct Ten from NHANVIEN join CHUNGNHAN on NHANVIEN.MaNV=CHUNGNHAN.MaNV
						 join MAYBAY on MAYBAY.MaMB=CHUNGNHAN.MaMB
where Hieu like 'Airbus%'

/* 16. Với mỗi loại máy bay có phi công lái, cho biết mã số, 
loại máy bay và tổng số phi công có thể lái loại máy bay đó */
select MayBay.MaMB, Hieu, count(chungnhan.manv) 
from MAYBAY join CHUNGNHAN on MAYBAY.MaMB=CHUNGNHAN.MaMB
group by MayBay.MaMB, Hieu

/* 17. Giả sử một hành khách muốn đi thẳng từ ga A đến ga B rồi quay trở về ga A. 
	Cho biết các đường bay nào có thể đáp ứng yêu cầu này */
select * from CHUYENBAY

-- 18. Với mỗi ga có chuyến bay xuất phát từ đó, cho biết có bao nhiêu chuyến bay khởi hành từ ga đó
select GaDi, count(*) from CHUYENBAY
group by GaDi

/* 19. Với mỗi ga có chuyến bay xuất phát từ đó, 
		cho biết tổng chi phí phải trả chi phi công lái các chuyến bay khởi hành từ ga đó. */
select GaDi, sum(ChiPhi) from CHUYENBAY
group by GaDi

-- 20. Với mỗi ga xuất phát, cho biết có bao nhiêu chuyến bay có thể khởi hành trước 12:00
select GaDi, count(GioDi) from CHUYENBAY
where GioDi < '12:00'
group by GaDi

-- 21. Cho biết mã số của phi công chỉ lái được 3 loại máy bay
select MaNV from ChungNhan
group by MaNV
having count(MaMB)=3

/* 22. Với mỗi phi công có thể lái nhiều hơn 3 loại máy bay, 
	cho biết mã số phi công và tầm bay lớn nhất của các loại máy bay mà phi công đó có thể lái */

	
	select MaNV, max(TamBay) from CHUNGNHAN join MAYBAY on CHUNGNHAN.MaMB=MAYBAY.MaMB
	group by MaNV
	having count(MaNV)>3

	select * from maybay

-- 23. Cho biết mã số của các phi công có thể lái được nhiều loại máy bay nhất
select MaNV, count(MaMB) as 'SoLuong' from CHUNGNHAN
group by MaNV
order by SoLuong desc

-- 24. Cho biết mã số của các phi công có thể lái được ít loại máy bay nhất
select MaNV, count(*) as 'SoLuong' from CHUNGNHAN
group by MaNV
order by SoLuong asc

-- 25. Tìm các nhân viên không phải là phi công
select MaNV from NHANVIEN
except
	-- Các nhân viên là phi công
	(select distinct MaNV from CHUNGNHAN)

-- 26. Cho biết mã số của các nhân viên có lương cao nhất
select MaNV, Ten, Luong from NHANVIEN
order by Luong desc

-- 27. Cho biết tổng số lương phải trả cho các phi công
select sum(Luong) as 'Tổng số lương' from NHANVIEN

-- 28. Tìm các chuyến bay có thể được thực hiện bởi tất cả các loại máy bay Boeing
select * from CHUYENBAY

-- 29. Cho biết mã số của các máy bay có thể được sử dụng để thực hiện chuyến bay từ Sài gòn (SGN) đến Huế (HUI)
select MaMB from MAYBAY 
where TamBay >= 
				(select DoDai from CHUYENBAY where GaDi like 'SGN' and GaDen like 'HUI')

-- 30. Tìm các chuyến bay có thể được lái bởi các phi công có lương lớn hơn 100.000
select * from CHUYENBAY
where DoDai<
			(select min(TamBay) from MAYBAY join CHUNGNHAN on MAYBAY.MaMB=CHUNGNHAN.MaMB
									   join NHANVIEN on NHANVIEN.MaNV=CHUNGNHAN.MaNV
			where CHUNGNHAN.MaNV in 
								-- Các phi công lương lớn hơn 100 000
								(select MaNV from NHANVIEN where Luong>100000))

/* 31. Cho biết tên các phi công có lương nhỏ hơn chi phí thấp nhất 
			của đường bay từ Sài Gòn (SGN) đến Buôn mê Thuột (BMV) */
select * from NHANVIEN 
where Luong <
		(select ChiPhi from chuyenbay where GaDen like 'BMV' and GaDi like 'SGN')

-- 32. Cho biết mã số của các phi công có lương cao nhất
select * from NHANVIEN
order by Luong desc

-- 33. Cho biết mã số của các nhân viên có lương cao thứ nhì

-- 34. Cho biết mã số của các phi công có lương cao nhất hoặc thứ nhì

/* 35. Cho biết tên và lương của các nhân viên không phải là phi công và 
			có lương lớn hơn lương trung bình của tất cả các phi công. */
select Ten, Luong from NHANVIEN 
where Luong >
			-- Lương trung bình của các phi công
			(select AVG(Luong) from NHANVIEN
			where MaNV in 
						 (select distinct MaNV from CHUNGNHAN))
except 
	select Ten, Luong from NHANVIEN join CHUNGNHAN on NHANVIEN.MaNV=CHUNGNHAN.MaNV

/* 36. Cho biết tên các phi công có thể lái các máy bay có tầm bay lớn hơn 4.800km 
											nhưng không có chứng nhận lái máy bay Boeing */
select distinct Ten, Hieu, TamBay from NhanVien join ChungNhan on NHANVIEN.MaNV=CHUNGNHAN.MaNV
							   join MayBay on CHUNGNHAN.MaMB=MAYBAY.MaMB
where TamBay>4800 and Hieu not like 'Boeing%'

-- 37. Cho biết tên các phi công lái ít nhất 3 loại máy bay có tầm xa hơn 3200km
select Ten from NHANVIEN

select count(MaMB) from CHUNGNHAN
group by MaNV





