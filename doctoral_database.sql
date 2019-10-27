DROP DATABASE IF EXISTS DOCTORAL;
CREATE DATABASE DOCTORAL;
USE DOCTORAL;

DROP TABLE IF EXISTS INSTRUCTOR;
DROP TABLE IF EXISTS TT;
DROP TABLE IF EXISTS PHDSTUDENT;
DROP TABLE IF EXISTS GTA;
DROP TABLE IF EXISTS GRA;
DROP TABLE IF EXISTS SELFSUPPORT;
DROP TABLE IF EXISTS COURSE;
DROP TABLE IF EXISTS SECTION;
DROP TABLE IF EXISTS COURSESTAUGHT;
DROP TABLE IF EXISTS MILESTONE;
DROP TABLE IF EXISTS MILESTONESPASSED;
DROP TABLE IF EXISTS GRANTS;
DROP TABLE IF EXISTS GRANTSASSOCIATED;
DROP TABLE IF EXISTS PHDCOMMITTEE;
DROP TABLE IF EXISTS GRANTSASSOCIATED;
DROP TABLE IF EXISTS PHDCOMMITTEE;

CREATE TABLE INSTRUCTOR(  
	InstructorId CHAR(10) NOT NULL PRIMARY KEY,  
	Fname VARCHAR(25) NOT NULL,
	Lname VARCHAR(25) NOT NULL,
	StartDate DATE,
	Degree CHAR(12),
	Rank CHAR(12),
	Type CHAR(10)
);

CREATE TABLE TT(
	InstructorID CHAR(10) NOT NULL PRIMARY KEY,
	NoOfPhDStudents INT NOT NULL,
	FOREIGN KEY(InstructorID) REFERENCES INSTRUCTOR(InstructorId)
);

CREATE TABLE PHDSTUDENT(
	StudentId CHAR(10) NOT NULL PRIMARY KEY,
	FName VARCHAR(25) NOT NULL,
	Lname VARCHAR(25) NOT NULL,
	StSem CHAR (10),
	StYear INT,
	Supervisor CHAR(10) NOT NULL
);

CREATE TABLE GTA(
	SectionId CHAR(10),
	MonthlyPay INT,
	StudentId CHAR(10) NOT NULL PRIMARY KEY,
	FOREIGN KEY(StudentId) REFERENCES PHDSTUDENT(StudentId)
);

CREATE TABLE GRA(
    StudentId CHAR(10) NOT NULL PRIMARY KEY,
    Funding CHAR(10),
    MonthlyPay INT,
    FOREIGN KEY(StudentId) REFERENCES PHDSTUDENT(StudentId)
);


CREATE TABLE SELFSUPPORT (
 StudentId CHAR(10) NOT NULL PRIMARY KEY,
 FOREIGN KEY(StudentId) REFERENCES PHDSTUDENT(StudentId)
);

CREATE TABLE SCHOLARSHIPSUPPORT (
	StudentId CHAR(10) NOT NULL PRIMARY KEY,
	Type CHAR(10) NOT NULL,
	Source CHAR(10),
	FOREIGN KEY(StudentId) REFERENCES PHDSTUDENT(StudentId)
);

CREATE TABLE COURSE (
	CourseId CHAR(10) NOT NULL PRIMARY KEY,
	CName CHAR(100)
);

CREATE TABLE SECTION (
	SectionId CHAR(10) NOT NULL PRIMARY KEY ,
	CourseId CHAR(10),
	FOREIGN KEY(CourseId) REFERENCES COURSE(CourseId)
);

CREATE TABLE COURSESTAUGHT (
	CourseId CHAR(10) NOT NULL,
	InstructorId CHAR(10) NOT NULL,
	PRIMARY KEY(CourseId , InstructorId),
	FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId),
	FOREIGN KEY (InstructorId) REFERENCES INSTRUCTOR(InstructorId)
);

CREATE TABLE MILESTONE (
	MID CHAR(10) NOT NULL PRIMARY KEY,
	MName CHAR(100)
);

CREATE TABLE MILESTONESPASSED (
	StudentId CHAR(10) NOT NULL,
	MId CHAR(10) NOT NULL,
	PassDate DATE,
	PRIMARY KEY(StudentId, MID),
	FOREIGN KEY(StudentId) REFERENCES PHDSTUDENT(StudentId),
	FOREIGN KEY(MId) REFERENCES MILESTONE(MID)
);

CREATE TABLE GRANTS (
	AccountNo CHAR(10) NOT NULL PRIMARY KEY,
	Type CHAR(10),
	GrantTitle CHAR(10),
	Source CHAR(10),
	StDate DATE,
	EndDate DATE,
	StAmount INT,
	CurrentBalance INT
);


CREATE TABLE GRANTSASSOCIATED(
	AccountNo CHAR(10) NOT NULL,
	InstructorId CHAR(10) NOT NULL,
	InstrType CHAR(15),
	PRIMARY KEY(AccountNo,InstructorID),
	FOREIGN KEY(InstructorID) REFERENCES INSTRUCTOR(InstructorID)
);


CREATE TABLE PHDCOMMITTEE(
	StudentId CHAR(10) NOT NULL,
	InstructorId CHAR(10) NOT NULL,
	PRIMARY KEY(StudentId,InstructorId),
	FOREIGN KEY(StudentId) REFERENCES PHDSTUDENT(StudentId),
	FOREIGN KEY(InstructorId) REFERENCES INSTRUCTOR(InstructorId)
);

LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_Instructor.txt' INTO TABLE INSTRUCTOR FIELDS TERMINATED BY ',' IGNORE 1 LINES;	
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_TT.txt' INTO TABLE TT FIELDS TERMINATED BY ',' IGNORE 1 LINES;	
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_PhDStudent.txt' INTO TABLE PHDSTUDENT FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_GTA.txt' INTO TABLE GTA  FIELDS TERMINATED BY ',' IGNORE 1 LINES;	 
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_GRA.txt' INTO TABLE GRA FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_SelfSupport.txt' INTO TABLE SELFSUPPORT FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_ScholarshipSupport.txt' INTO TABLE SCHOLARSHIPSUPPORT FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_Course.txt' INTO TABLE COURSE FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_Section.txt' INTO TABLE SECTION FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_CoursesTaught.txt' INTO TABLE COURSESTAUGHT FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_Milestone.txt' INTO TABLE MILESTONE FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_MilestonesPassed.txt' INTO TABLE MILESTONESPASSED FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_Grants.txt' INTO TABLE GRANTS FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_GrantAssociated.txt' INTO TABLE GRANTSASSOCIATED FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'C:/Users/acer main/Desktop/Dataset/_PhdCommittee.txt' INTO TABLE PHDCOMMITTEE FIELDS TERMINATED BY ',' IGNORE 1 LINES;

SELECT * FROM PHDSTUDENT;
SELECT * FROM INSTRUCTOR;
SELECT * FROM GRA;
SELECT * FROM GRANTS;
/*
SELECT * FROM INSTRUCTOR;
SELECT * FROM TT;

SELECT * FROM GTA;
SELECT * FROM GRA;
SELECT * FROM SELFSUPPORT;
SELECT * FROM SCHOLARSHIPSUPPORT;
SELECT * FROM COURSE;
SELECT * FROM SECTION;
SELECT * FROM COURSESTAUGHT;
SELECT * FROM MILESTONE;
SELECT * FROM MILESTONESPASSED;
SELECT * FROM GRANTS;
SELECT * FROM GRANTSASSOCIATED;
SELECT * FROM PHDCOMMITTEE;
*/

CREATE VIEW SUPERVISION_INFO(IId,IFName,ILName,SId,SFName,SLName,SStSem,SStYear)
AS SELECT 	Instructor.InstructorId,Instructor.FName,Instructor.LName, PHDSTUDENT.StudentId,PHDSTUDENT.FName,
				PHDSTUDENT.LName,PHDSTUDENT.StSem,PHDSTUDENT.StYear
FROM 			INSTRUCTOR,PHDSTUDENT
WHERE			Instructor.InstructorId = PHDSTUDENT.Supervisor;

SELECT * FROM SUPERVISION_INFO;

/* 2.A*/
SELECT	IId,IFName,ILNAME,COUNT(SId) AS NoOfStudentsSupervised	
FROM 		SUPERVISION_INFO AS SI;

/*B*/
SELECT SFName,SLName
FROM SUPERVISION_INFO AS SI
WHERE SI.IFName = "Ahmed" AND SI.ILName = "Sarhan";

/*C*/
SELECT IFNAME,ILNAME,SFNAME,SLNAME
FROM SUPERVISION_INFO AS SI
WHERE (SI.SFNAME = "Ife" AND SI.SLNAME = "Jelani") 
AND ( SI.SFNAME = "Maya" AND SI.SLNAME = "Smith")
AND (SI.SFNAME = "Raymond" AND SI.SLNAME = "Wilson");

/*3.i*/
SELECT 	PHDSTUDENT.StudentId,FName,Lname,MILESTONE.MName,PassDate
FROM 		PHDSTUDENT,MILESTONE,MILESTONESPASSED
WHERE 	(PHDSTUDENT.StudentId = MILESTONESPASSED.StudentId) 
		    AND (MILESTONESPASSED.MId =  MILESTONE.MID);

/*ii
SELECT PHDSTUDENT.StudentId,FName,Lname,*/
