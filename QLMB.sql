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