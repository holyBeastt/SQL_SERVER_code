CREATE DATABASE SPJ1
USE SPJ1
GO

/* CREATE TABLE */
CREATE TABLE NCC
(
	MaNCC char(5),
	Ten varchar(40) not null,
	Heso int default 0 check (Heso between 0 and 100),
	ThPho varchar(20) not null
)


CREATE TABLE VATTU
(
	MaVT char(5),
	Ten varchar(40) not null,
	Mau varchar(15) unique,
	TrLuong float default 0
)

CREATE TABLE DUAN
(
	MaDA char(5),
	Ten varchar(40) not null,
	ThPho varchar(20) not null
)

CREATE TABLE CC
(
	MaNCC char(5) not null,
	MaVT char(5) not null,
	MaDA char(5) not null,
	SoLuong int default 0
)

/* ALTER TABLE 
	Thêm not null để add đc primary key */
ALTER TABLE NCC
	ALTER COLUMN MaNCC char(5) not null

ALTER TABLE VATTU
	ALTER COLUMN MaVT char(5) not null

ALTER TABLE DUAN
	ALTER COLUMN MaDA char(5) not null




/* ADD PRIMARY KEY */
ALTER TABLE NCC
	ADD CONSTRAINT PK_MaNCC PRIMARY KEY (MaNCC)

ALTER TABLE VATTU
	ADD CONSTRAINT PK_MaVT PRIMARY KEY (MaVT)

ALTER TABLE DUAN
	ADD CONSTRAINT PK_MaDA PRIMARY KEY (MaDA)

ALTER TABLE CC
	ADD CONSTRAINT PK_CC PRIMARY KEY (MaNCC, MaVT, MaDA)

