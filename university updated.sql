/* Delete the tables if they already exist */
DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;


DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS prerequisite CASCADE;
DROP TABLE IF EXISTS section CASCADE; 
DROP TABLE IF EXISTS course CASCADE;


CREATE TABLE student (
	name 	  	VARCHAR(50) NOT NULL,
	student_number  CHAR(9) NOT NULL,
	class_year 	CHAR(4),
	major		VARCHAR(20),
	PRIMARY KEY (student_number)
);

Insert INTO student values('Jonathan','S1','2018','MS');
Insert INTO student values('Marcu','S2','2018','MS');
Insert INTO student values('Margot','S3','2018','MS');
Insert INTO student values('Sarina','S4','2018','MS');

CREATE TABLE course (
	course_name 	VARCHAR(50) NOT NULL,
	course_number	INT NOT NULL,
	credit_hours	INT,
	department	VARCHAR(40) NOT NULL,
	PRIMARY KEY (course_number)
--     CONSTRAINT course_number_limit  CHECK (course_number > 1000 AND course_number < 6999)
);

CREATE TABLE grade_report (
student_number CHAR(9) NOT NULL,
section_identifier INT(2) NOT NULL,
course_number INT(4) NOT NULL,
grade CHAR(2),
PRIMARY KEY (student_number,section_identifier,course_number),
FOREIGN KEY (course_number) REFERENCES course(course_number),
FOREIGN KEY (section_identifier) REFERENCES section(section_identifier),
FOREIGN KEY (student_number) REFERENCES student(student_number)
);

CREATE TABLE prerequisite (
    course_number INT NOT NULL,
    prerequisite_number INT NOT NULL ,
    PRIMARY KEY (course_number, prerequisite_number),
    FOREIGN KEY (course_number) REFERENCES course(course_number),
    FOREIGN KEY (course_number) REFERENCES course(course_number)
);
Insert INTO grade_report values('S1',1,2215,NULL);

INSERT INTO course VALUE ('Databases and SQL', 2215, 3, 'Computer Science');
INSERT INTO course VALUE ('Intro to C Programming', 1110, 3, 'Computer Science');
INSERT INTO course VALUE ('Data Structures and Algorithms', 2226, 3, 'Computer Science');

INSERT INTO course (course_name, course_number, department) 
VALUE ('Computer Organization Lab', 3331, 'Computer Science');


CREATE TABLE section (
    section_identifier INT NOT NULL,
    course_number INT NOT NULL,
    semester VARCHAR(10),
    year INT,
    instructor VARCHAR(50),
    PRIMARY KEY (section_identifier,course_number),
    FOREIGN KEY (course_number) REFERENCES course(course_number)
);

Update grade_report set grade = 'A1' 
where student_number = 'S1' and section_identifier = 1
and course_number = 2215;

Alter Table section
add column location varchar(10);

Update section s
INNER JOIN  
course c
ON c.course_number = s.course_number  
SET s.location = 'BCKM 208' 
where course_name = 'Databases and SQL';

Alter table section
drop location;

INSERT INTO section (section_identifier, course_number, semester, year)
SELECT 1, course_number, 'Fall', 2019 FROM course; 

INSERT INTO section VALUE (2, 1110, 'Fall', 2019, NULL);

DELETE FROM section WHERE course_number = 1110;

UPDATE section SET instructor = 'Sara Riazi' 
WHERE course_number = 2215;

Delete from grade_report where student_number = 'S1' and section_identifier = 1
and course_number = 2215;

DROP TABLE IF EXISTS grade_report CASCADE;

ALTER TABLE section
ADD days CHAR(3); 

ALTER TABLE section
ADD fee INT
DEFAULT 240;

Delete from student;

ALTER TABLE section
DROP fee;







