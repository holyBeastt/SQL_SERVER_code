CREATE DATABASE THU_VIEN
USE THU_VIEN


--CREATE TABLE 
CREATE TABLE BANDOC
(
	MaBD varchar(10) not null,
	HoteBD nvarchar(50),
	NgaySinh date,
	Lop varchar(10),
	QueQuan nvarchar(50),
	Sdt int,
)

CREATE TABLE SACH
(
	MaS varchar(10) not null,
	TenS nvarchar(50),
	TheLoai nvarchar(50),
	TacGia nvarchar(50),
	NamXB date,
	NhaXB nvarchar(50),
)

CREATE TABLE PHIEUMUON
(
	 MaBD varchar(10) not null,
	 MaS varchar(10) not null,
	 NgayMuon date check (NgayMuon >= getdate()),
	 NgayHenTra date,
	 TraSach bit default 0,
)

ALTER TABLE PHIEUMUON
	ADD CONSTRAINT NgayHT
	CHECK (DATEDIFF(DAY, NgayMuon, NgayHenTra) >=5)

-- ADD PRIMARY KEY
ALTER TABLE BANDOC
	ADD CONSTRAINT PK_MaBD
	PRIMARY KEY (MaBD)

ALTER TABLE SACH
	ADD CONSTRAINT PK_MaS
	PRIMARY KEY (MaS)