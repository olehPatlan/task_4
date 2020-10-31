SET NAMES utf8;

DROP DATABASE IF EXISTS task4;
CREATE DATABASE task4;

USE task4;

CREATE TABLE course(
id INTEGER auto_increment PRIMARY KEY,
course_title VARCHAR(70) NOT NULL UNIQUE
);

CREATE TABLE stud_groups(
id INTEGER auto_increment PRIMARY KEY,
name_group  VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE student(
id INTEGER auto_increment PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
id_group INTEGER,
FOREIGN KEY (id_group) REFERENCES stud_groups(id) 
);

CREATE TABLE teacher(
id INTEGER auto_increment PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL
);

CREATE TABLE teacher_course(
teacher_id INTEGER,
course_id INTEGER,
FOREIGN KEY (course_id) REFERENCES course(id),
FOREIGN KEY (teacher_id) REFERENCES teacher(id),
PRIMARY KEY(course_id)
);

CREATE TABLE marks(
student_id INTEGER,
course_id INTEGER ,
mark INTEGER NOT NULL CHECK (mark>0 AND mark<6),
FOREIGN KEY (student_id) REFERENCES student(id),
FOREIGN KEY (course_id) REFERENCES course(id),
PRIMARY KEY(student_id, course_id)
);