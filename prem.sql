SET SQL_SAFE_UPDATES = 0;

-- drop database ttm_system;
CREATE DATABASE IF NOT EXISTS ttm_system;
USE ttm_system;

create table Admin(ID varchar(20) primary key, password varchar(20) not null, dept char(3));
create table Faculty(Faculty_ID varchar(20) primary key, Faculty_name varchar(20) not null, Course_ID varchar(20), dept char(3));
create table Timetable(Timetable_ID varchar(20) primary key, Sem int not null, year int not null);
create table Courses(Course_ID varchar(20) primary key, Course_name varchar(20) not null, total_hours int, hours_per_week int, HOD varchar(20) not null);
create table A(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));
create table B(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));
create table C(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));
create table D(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));
create table E(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));
create table F(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));
create table G(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));
create table H(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));
create table I(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));
create table J(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));
create table K(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));
create table L(section varchar(20) primary key, dept char(3), day varchar(20) not null, 8_00_8_45 varchar(20) not null, 8_45_9_30 varchar(20) not null, 9_30_10_15 varchar(20) not null, 10_45_11_30 varchar(20) not null, 11_30_12_15 varchar(20) not null, 12_15_1_00 varchar(20) not null, 1_45_2_30 varchar(20), 2_30_3_15 varchar(20));

show tables;

alter table Faculty
add constraint fk_fk1
foreign key (Course_ID) 
references Courses (Course_ID);

alter table Timetable
add Classroom VARCHAR(255),
add Building varchar(10),
add Room varchar(6),
add Floor int;

-- ALTER TABLE Timetable
-- DROP COLUMN classroom;

--NOT DONE YET
UPDATE Timetable
SET Classroom = CONCAT(Building, ' - ', Room, ' - ', Floor);

-- ALTER TABLE Faculty
-- DROP COLUMN office;

alter table Faculty
ADD office VARCHAR(255),
add Building varchar(10),
add Floor int,
add Room varchar(6),
add Desk int,
add Contact_number int(10);


UPDATE Faculty
SET office = CONCAT(Building, ' - ', Room, ' - ', Floor, ' - ', Desk, ' - ', Contact_number);


