
create database ttm_system;

use ttm_system;

create table Admin(ID varchar(20) primary key, password varchar(20) not null, dept char(3));
create table Faculty(Faculty_ID varchar(20) primary key, Faculty_name varchar(20) not null, Course_ID varchar(20), dept char(3), office varchar(50));
create table Timetable(Timetable_ID varchar(20) primary key, Sem int not null, year int not null, classroom varchar(20), time_slot varchar(20) not null, Course_ID varchar(20) not null, Faculty_ID varchar(20) not null);
create table Courses(Course_ID varchar(20) primary key, Course_name varchar(20) not null, total_hours int, hours_per_week int, HOD varchar(20) not null);

-- show tables;

alter table Timetable
add constraint fk_fk1
foreign key (Course_ID) 
references Courses (Course_ID);

alter table Timetable
add constraint fk_fk2
foreign key (Faculty_ID) 
references Faculty (Faculty_ID);

alter table Timetable
add Building varchar(10),
add Room varchar(6),
add Floor int;

-- UPDATE Timetable
-- SET Classroom = CONCAT(Building, ' - ', Floor, ' - ', Room);