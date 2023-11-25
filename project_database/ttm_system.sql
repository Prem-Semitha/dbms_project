SET SQL_SAFE_UPDATES = 0;

DROP DATABASE ttm_system;
CREATE DATABASE IF NOT EXISTS ttm_system;
USE ttm_system;

create table Admin(ID varchar(20) primary key, password varchar(20) not null);
create table Faculty(Faculty_ID int(3) primary key, Faculty_name varchar(20) not null);
create table Courses(Course_ID varchar(20) primary key, Course_name varchar(20) not null);
create table Timetable_course_faculty_details(Section varchar(10), Faculty_ID varchar(20) not null, Course_ID varchar(20) not null, day varchar(10) not null, start_time int(5) not null, end_time int(5) not null);

-- inserting into faculty, NEED TO ADD OFFICE!!!!!!!

ALTER TABLE Faculty
MODIFY COLUMN Faculty_name VARCHAR(50);

ALTER TABLE Timetable_course_faculty_details
MODIFY COLUMN start_time VARCHAR(5);

ALTER TABLE Timetable_course_faculty_details
MODIFY COLUMN end_time VARCHAR(5);


insert into Faculty(Faculty_ID ,  Faculty_name)
values
(1, 'Prof. Prafullata Kiran Auradkar'),
(2, 'Prof. Mohan Kumar A V'),
(3, 'Prof. Mahitha G'),
(4, 'Dr. S Saranya Rubini'),
(5, 'Prof. Bhargavi Mokashi'),
(6, 'Dr. Nagasudari S'),
(7, 'Dr. Shivakumar Dalali'),
(8, 'Dr. Preethi P'),
(9, 'Dr. Shylaja S S'),
(10, 'Prof. Chitra G M'),
(11, 'Prof. K S Srinivas'),
(12, 'Ms Uma D'),
(13, 'Ms Ashwini Joshi'),
(14, 'Dr. Surabhi Narayan'),
(15, 'Prof. V R Badri Prasad'),
(16, 'Prof. Anand M S'),
(17, 'Dr. Sapna V M'),
(18, 'Prof Raghu B A'),
(19, 'Dr. Sivagamasundari G'),
(20, 'Dr. Radhika M Hirannaiah'),
(21, 'Prof. Sumy Joseph A'),
(22, 'Prof. Venkatesh Prasad'),
(23, 'Prof.Dinesh Singh'),
(24, 'Dr.Gowri Srinivasa'),
(25, 'Prof.Bhaskar Jyothi Das'),
(26, 'Dr.Nagegowda.K.S'),
(27, 'Dr.Jyothi.R'),
(28, 'Dr.Sujatha.R. Upadhyaya'),
(29, 'Prof.Suresh Jamadagni'),
(30, 'Prof.Vadiraja.A'),
(31, 'Dr.Shruti Jadon'),
(32, 'Dr. Adithya Balasubramanyam'),
(33, 'Prof.Nitin V Pujari'),
(34, 'Prof. Divyashree N'),
(35, 'Prof.Preet Kanwal');

-- inserting values into courses
INSERT INTO Courses(Course_ID, Course_name)
VALUES 
('UE21CS351A', 'DBMS'),
('UE21CS352A', 'MI'),
('UE21CS341A', 'SE'),
('UE21CS342AA1', 'AA'),
('UE21CS342AA2', 'DA'),
('UE21CS342AA3', 'IOT'),
('UE21CS342AA4', 'AC'),
('UE21CS342AA5', 'ARVR'),
('UE21CS342AA6', 'HCI'),
('UE21CS343AB2', 'BD'),
('UE21CS343AB3', 'GTA'),
('UE21CS343AB6', 'CNS');

insert into Timetable_course_faculty_details(Section, Faculty_ID, Course_ID, day, start_time, end_time)
values
('A', 1, 'UE21CS351A', 'Monday', '8:00', '9:30'),
('A', 1, 'UE21CS351A', 'Tuesday', '12:15', '13:00'),
('A', 1, 'UE21CS351A', 'Wednesday', '8:00', '9:30'),
('A', 1, 'UE21CS351A', 'Thursday', '9:30', '10:15'),
('A', 1, 'UE21CS351A', 'Friday', '10:45', '12:15'),
('E2AA', 1, 'UE21CS343AB2', 'Tuesday', '8:00', '10:15'),
('E2AA', 1, 'UE21CS343AB2', 'Thursday', '10:45', '13:00'),

('B', 2, 'UE21CS351A', 'Monday', '9:30', '11:30'),
('B', 2, 'UE21CS351A', 'Tuesday', '10:45', '12:15'),
('B', 2, 'UE21CS351A', 'Wednesday', '8:00', '9:30'),
('B', 2, 'UE21CS351A', 'Thursday', '9:30', '10:15'),
('B', 2, 'UE21CS351A', 'Friday', '12:15', '13:00'),

('C', 3, 'UE21CS351A', 'Monday', '11:30', '13:00'),
('C', 3, 'UE21CS351A', 'Tuesday', '13:45', '15:15'),
('C', 3, 'UE21CS351A', 'Thursday', '13:45', '15:15'),
('C', 3, 'UE21CS351A', 'Friday', '11:30', '13:00'),
('G', 3, 'UE21CS351A', 'Monday', '8:00', '9:30'),
('G', 3, 'UE21CS351A', 'Tuesday', '10:45', '12:15'),
('G', 3, 'UE21CS351A', 'Wednesday', '9:30', '10:15'),
('G', 3, 'UE21CS351A', 'Thursday', '8:00', '9:30'),
('G', 3, 'UE21CS351A', 'Friday', '10:45', '11:30'),

('D', 4, 'UE21CS351A', 'Monday', '8:00', '9:30'),
('D', 4, 'UE21CS351A', 'Tuesday', '10:45', '11:30'),
('D', 4, 'UE21CS351A', 'Tuesday', '13:45', '15:15'),
('D', 4, 'UE21CS351A', 'Thursday', '13:45', '15:15'),
('D', 4, 'UE21CS351A', 'Friday','12:15', '13:00'),
('K', 4, 'UE21CS351A', 'Monday','11:30', '13:00'),
('K', 4, 'UE21CS351A', 'Tuesday','12:15', '13:00'),
('K', 4, 'UE21CS351A', 'Wednesday','8:00', '9:30'),
('K', 4, 'UE21CS351A', 'Thursday','9:30', '10:15'),
('K', 4, 'UE21CS351A', 'Friday','10:45', '12:15'),

('E', 5, 'UE21CS351A', 'Monday', '9:30', '11:30'),
('E', 5, 'UE21CS351A', 'Tuesday', '10:45', '12:15'),
('E', 5, 'UE21CS351A', 'Wednesday', '9:30', '10:15'),
('E', 5, 'UE21CS351A', 'Thursday', '8:00', '9:30'),
('E', 5, 'UE21CS351A', 'Friday', '12:15', '13:00'),
('H', 5, 'UE21CS351A', 'Monday', '11:30', '13:00'),
('H', 5, 'UE21CS351A', 'Tuesday', '13:45', '15:15'),
('H', 5, 'UE21CS351A', 'Thursday', '13:45', '15:15'),
('H', 5, 'UE21CS351A', 'Friday', '10:45', '12:15'),

('F', 6, 'UE21CS351A', 'Monday','11:30','13:00'),
('F', 6, 'UE21CS351A', 'Tuesday','10:45','12:15'),
('F', 6, 'UE21CS351A', 'Thurday','13:45','15:15'),
('F', 6, 'UE21CS351A', 'Friday','10:45','12:15'),
('L', 6, 'UE21CS351A', 'Monday','8:00','9:30'),
('L', 6, 'UE21CS351A', 'Tuesday','12:15','15:15'),
('L', 6, 'UE21CS351A', 'Wednesday','8:00','9:30'),
('L', 6, 'UE21CS351A', 'Friday','12:15','13:00'),

('I', 7, 'UE21CS351A', 'Monday','8:00','9:30'),
('I', 7, 'UE21CS351A', 'Tuesday','11:30','13:00'),
('I', 7, 'UE21CS351A', 'Thursday','13:45','15:15'),
('I', 7, 'UE21CS351A', 'Friday','10:45','12:15'),
('J', 7, 'UE21CS351A', 'Monday','9:30','11:30'),
('J', 7, 'UE21CS351A', 'Tuesday','10:45','11:30'),
('J', 7, 'UE21CS351A', 'Wednesday','8:00','10:15'),
('J', 7, 'UE21CS351A', 'Thursday','9:30','10:15'),
('J', 7, 'UE21CS351A', 'Friday','12:15','13:00'),

('A', 8, 'UE21CS352A', 'Monday','9:30','11:30'),
('A', 8, 'UE21CS352A', 'Tuesday','10:45','12:15'),
('A', 8, 'UE21CS352A', 'Wednesday','9:30','10:15'),
('A', 8, 'UE21CS352A', 'Thursday','13:45','15:15'),
('A', 8, 'UE21CS352A', 'Friday','12:15','13:00'),
('J', 8, 'UE21CS352A', 'Monday','11:30','13:00'),
('J', 8, 'UE21CS352A', 'Tuesday','13:45','15:15'),
('J', 8, 'UE21CS352A', 'Thursday','8:00','9:30'),
('J', 8, 'UE21CS352A', 'Friday','10:45','12:15'),

('B', 9, 'UE21CS352A', 'Monday','11:30','13:00'),
('B', 9, 'UE21CS352A', 'Tuesday','13:45','15:15'),
('B', 9, 'UE21CS352A', 'Thursday','13:45','15:15'),
('B', 9, 'UE21CS352A', 'Friday','10:45','12:15'),

('C', 10, 'UE21CS352A', 'Monday','8:00','9:30'),
('C', 10, 'UE21CS352A', 'Tuesday','11:30','13:00'),
('C', 10, 'UE21CS352A', 'Wednesday','8:00','9:30'),
('C', 10, 'UE21CS352A', 'Thursday','9:30','10:15'),
('C', 10, 'UE21CS352A', 'Friday','10:45','11:30'),
('I', 10, 'UE21CS352A', 'Monday','9:30','11:30'),
('I', 10, 'UE21CS352A', 'Tuesday','13:45','15:15'),
('I', 10, 'UE21CS352A', 'Wednesday','9:30','10:15'),
('I', 10, 'UE21CS352A', 'Thursday','8:30','9:30'),
('I', 10, 'UE21CS352A', 'Friday','12:15','13:00'),

('D', 11, 'UE21CS352A', 'Monday','11:30','13:00'),
('D', 11, 'UE21CS352A', 'Wednesday','8:00','10:15'),
('D', 11, 'UE21CS352A', 'Thursday','8:00','10:15'),
('E1BB', 11, 'UE21CS342AA2', 'Tuesday','10:45','13:00'),
('E1BB', 11, 'UE21CS342AA2', 'Thursday','8:00','10:15'),

('E', 12, 'UE21CS352A', 'Monday','11:30','13:00'),
('E', 12, 'UE21CS352A', 'Tuesday','12:15','13:00'),
('E', 12, 'UE21CS352A', 'Wednesday','8:00','9:30'),
('E', 12, 'UE21CS352A', 'Thursday','9:30','10:15'),
('E', 12, 'UE21CS352A', 'Friday','10:45','12:15'),
('K', 12, 'UE21CS352A', 'Monday','9:30','12:15'),
('K', 12, 'UE21CS352A', 'Tuesday','10:45','12:15'),
('K', 12, 'UE21CS352A', 'Wednesday','9:30','10:15'),
('K', 12, 'UE21CS352A', 'Thursday','13:45','15:15'),
('K', 12, 'UE21CS352A', 'Friday','12:15','13:00'),

('F', 13, 'UE21CS352A', 'Monday','9:30','11:30'),
('F', 13, 'UE21CS352A', 'Tuesday','13:45','15:15'),
('F', 13, 'UE21CS352A', 'Wednesday','9:30','10:15'),
('F', 13, 'UE21CS352A', 'Thursday','8:00','9:30'),
('F', 13, 'UE21CS352A', 'Friday','12:15','13:00'),
('H', 13, 'UE21CS352A', 'Monday','8:00','9:30'),
('H', 13, 'UE21CS352A', 'Tuesday','10:45','13:00'),
('H', 13, 'UE21CS352A', 'Wednesday','8:00','9:30'),
('H', 13, 'UE21CS352A', 'Thursday','9:30','10:15'),

('G', 14, 'UE21CS352A', 'Monday','9:30','11:30'),
('G', 14, 'UE21CS352A', 'Tuesday','13:45','15:15'),
('G', 14, 'UE21CS352A', 'Wednesday','8:00','9:30'),
('G', 14, 'UE21CS352A', 'Friday','11:30','13:00'),
('E2BA', 14, 'UE21CS343AB3', 'Tuesday','8:00','10:15'),
('E2BA', 14, 'UE21CS343AB3', 'Thursday','10:45','13:00'),

-- Faculty id 15

('L', 15, 'UE21CS352A', 'Monday','9:30','12:15'),
('L', 15, 'UE21CS352A', 'Tuesday','10:45','12:15'),
('L', 15, 'UE21CS352A', 'Thursday','8:00','10:15'),

('A', 16, 'UE21CS341A', 'Monday','11:30','13:00'),
('A', 16, 'UE21CS341A', 'Tuesday','13:45','15:15'),
('A', 16, 'UE21CS341A', 'Thursday','8:00','9:30'),
('D', 16, 'UE21CS341A', 'Monday','9:30','11:30'),
('D', 16, 'UE21CS341A', 'Tuesday','11:30','13:00'),
('D', 16, 'UE21CS341A', 'Friday','10:45','12:15'),

('B', 17, 'UE21CS341A', 'Monday','8:00','9:30'),
('B', 17, 'UE21CS341A', 'Tuesday','12:15','13:00'),
('B', 17, 'UE21CS341A', 'Wednesday','9:30','10:15'),
('B', 17, 'UE21CS341A', 'Thursday','8:00','9:30'),
('I', 17, 'UE21CS341A', 'Monday','11:30','13:00'),
('I', 17, 'UE21CS341A', 'Tuesday','10:45','11:30'),
('I', 17, 'UE21CS341A', 'Wednesday','8:00','9:30'),
('I', 17, 'UE21CS341A', 'Thursday','9:30','10:15'),

('C', 18, 'UE21CS341A', 'Monday','9:30','11:30'),
('C', 18, 'UE21CS341A', 'Tuesday','10:45','11:30'),
('C', 18, 'UE21CS341A', 'Wednesday','9:30','10:15'),
('C', 18, 'UE21CS341A', 'Thursday','8:00','9:30'),
('J', 18, 'UE21CS341A', 'Monday','8:00','9:30'),
('J', 18, 'UE21CS341A', 'Tuesday','11:30','13:00'),
('J', 18, 'UE21CS341A', 'Thursday','13:45','15:15'),

('E', 19, 'UE21CS341A', 'Monday','8:00','9:30'),
('E', 19, 'UE21CS341A', 'Tuesday','13:45','15:15'),
('E', 19, 'UE21CS341A', 'Thursday','13:45','15:15'),
('H', 19, 'UE21CS341A', 'Monday','9:30','11:30'),
('H', 19, 'UE21CS341A', 'Wednesday','9:30','10:15'),
('H', 19, 'UE21CS341A', 'Thursday','8:00','9:30'),
('H', 19, 'UE21CS341A', 'Friday','12:15','13:00'),

('F', 20, 'UE21CS341A', 'Monday','8:00','9:30'),
('F', 20, 'UE21CS341A', 'Tuesday','12:15','13:00'),
('F', 20, 'UE21CS341A', 'Wednesday','8:00','9:30'),
('F', 20, 'UE21CS341A', 'Thursday','9:30','10:15'),
('E2CA', 20, 'UE21CS343AB6', 'Tuesday','8:00','10:15'),
('E2CA', 20, 'UE21CS343AB6', 'Thursday','10:45','13:00'),

('G', 21, 'UE21CS341A', 'Monday','11:30','13:00'),
('G', 21, 'UE21CS341A', 'Tuesday','12:15','13:00'),
('G', 21, 'UE21CS341A', 'Thursday','9:30','10:15'),
('G', 21, 'UE21CS341A', 'Thursday','13:45','15:15'),
('K', 21, 'UE21CS341A', 'Monday','8:00','9:30'),
('K', 21, 'UE21CS341A', 'Tuesday','13:45','15:15'),
('K', 21, 'UE21CS341A', 'Thursday','8:00','9:30'),

('L', 22, 'UE21CS341A', 'Monday','12:15','13:00'),
('L', 22, 'UE21CS341A', 'Wednesday','9:30','10:15'),
('L', 22, 'UE21CS341A', 'Thursday','13:45','15:15'),
('L', 22, 'UE21CS341A', 'Friday','10:45','12:15'),
('E2AC', 22, 'UE21CS343AB6', 'Tuesday','8:00','10:15'),
('E2AC', 22, 'UE21CS343AB6', 'Thursday','10:45','13:00'),

('E1A', 23, 'UE21CS342AA1', 'Wednesday','10:45','13:00'),
('E1A', 23, 'UE21CS342AA1', 'Friday','8:00','10:15'),
('E2BB', 23, 'UE21CS343AB3', 'Tuesday','8:00','10:15'),
('E2BB', 23, 'UE21CS343AB3', 'Thursday','10:45','13:00'),

('E1BA', 24, 'UE21CS342AA2', 'Wednesday','10:45','13:00'),
('E1BA', 24, 'UE21CS342AA2', 'Friday','8:00','10:15'),

('E1BC', 25, 'UE21CS342AA2', 'Wednesday','10:45','13:00'),
('E1BC', 25, 'UE21CS342AA2', 'Friday','8:00','10:15'),
('E2BC', 25, 'UE21CS343AB3', 'Tuesday','8:00','10:15'),
('E2BC', 25, 'UE21CS343AB3', 'Thursday','10:45','13:00'),

('E1BD', 26, 'UE21CS342AA2', 'Wednesday','10:45','13:00'),
('E1BD', 26, 'UE21CS342AA2', 'Friday','8:00','10:15'),

('E1BE', 27, 'UE21CS342AA2', 'Wednesday','10:45','13:00'),
('E1BE', 27, 'UE21CS342AA2', 'Friday','8:00','10:15'),

('E1BF', 28, 'UE21CS342AA2', 'Wednesday','10:45','13:00'),
('E1BF', 28, 'UE21CS342AA2', 'Friday','8:00','10:15'),
('E2BD', 28, 'UE21CS343AB3', 'Tuesday','8:00','10:15'),
('E2BD', 28, 'UE21CS343AB3', 'Thursday','10:45','13:00'),

('E1BG', 29, 'UE21CS342AA2', 'Wednesday','10:45','13:00'),
('E1BG', 29, 'UE21CS342AA2', 'Friday','8:00','10:15'),
('E2AB', 29, 'UE21CS343AB2', 'Tuesday','8:00','10:15'),
('E2AB', 29, 'UE21CS343AB2', 'Thursday','10:45','13:00'),

('E1C', 30, 'UE21CS342AA3', 'Wednesday','10:45','13:00'),
('E1C', 30, 'UE21CS342AA3', 'Friday','8:00','10:15'),
('E2AD', 30, 'UE21CS343AB2', 'Tuesday','8:00','10:15'),
('E2AD', 30, 'UE21CS343AB2', 'Thursday','10:45','13:00'),

('E1D', 31, 'UE21CS342AA3', 'Wednesday','10:45','13:00'),
('E1D', 31, 'UE21CS342AA3', 'Friday','8:00','10:15'),

('E1E', 32, 'UE21CS342AA4', 'Wednesday','10:45','13:00'),
('E1E', 32, 'UE21CS342AA4', 'Friday','8:00','10:15'),

('E1F', 33, 'UE21CS342AA5', 'Wednesday','10:45','13:00'),
('E1F', 33, 'UE21CS342AA5', 'Friday','8:00','10:15'),

('E2BE', 34, 'UE21CS343AB3', 'Tuesday','8:00','10:15'),
('E2BE', 34, 'UE21CS343AB3', 'Thursday','10:45','13:00'),

('E2BF', 35, 'UE21CS343AB6', 'Tuesday','8:00','10:15'),
('E2BF', 35, 'UE21CS343AB6', 'Thursday','10:45','13:00');
-- Adding foreign keys 
ALTER TABLE Timetable_course_faculty_details
ADD CONSTRAINT fk_course
FOREIGN KEY (Course_ID)
REFERENCES Courses(Course_ID);

-- Adding foreign key for Faculty_ID
-- we had to alter the tables before 
ALTER TABLE Timetable_course_faculty_details
MODIFY COLUMN Faculty_ID int(3);

ALTER TABLE Timetable_course_faculty_details
ADD CONSTRAINT fk_faculty
FOREIGN KEY (Faculty_ID)
REFERENCES Faculty(Faculty_ID);


insert into Timetable_course_faculty_details(Section, Faculty_ID, Course_ID, day, start_time, end_time)
values 

('D', 4, 'UE21CS351A', 'Tuesday', '13:45', '15:15'),