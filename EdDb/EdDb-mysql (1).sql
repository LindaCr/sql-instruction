drop database if exists EdDb;

create database EdDb;

use EdDb;


-- create the tables
create table ClassGrade (
	Grade varchar(3) primary key,
	GPA decimal(4,2) not null default 0.0
);

-- ClassGrade: Data
INSERT ClassGrade (Grade, GPA) VALUES ('A+',4.35);
INSERT ClassGrade (Grade, GPA) VALUES ('A',4.0);
INSERT ClassGrade (Grade, GPA) VALUES ('A-',3.7);
INSERT ClassGrade (Grade, GPA) VALUES ('B+',3.35);
INSERT ClassGrade (Grade, GPA) VALUES ('B',3.0);
INSERT ClassGrade (Grade, GPA) VALUES ('B-',2.7);
INSERT ClassGrade (Grade, GPA) VALUES ('C+',2.35);
INSERT ClassGrade (Grade, GPA) VALUES ('C',2.0);
INSERT ClassGrade (Grade, GPA) VALUES ('C-',1.7);
INSERT ClassGrade (Grade, GPA) VALUES ('D+',1.35);
INSERT ClassGrade (Grade, GPA) VALUES ('D',1.0);
INSERT ClassGrade (Grade, GPA) VALUES ('D-',0.5);
INSERT ClassGrade (Grade, GPA) VALUES ('F',0.0);

create table Major (
	Id int primary key auto_increment,
	Code varchar(4) not null,
	Description varchar(50) not null,
	MinSAT int not null
);

-- Major: Sample data
INSERT Major (Code, Description, MinSAT) VALUES ('GENB','General Business',800);
INSERT Major (Code, Description, MinSAT) VALUES ('ACCT','Accounting', 1000);
INSERT Major (Code, Description, MinSAT) VALUES ('FIN','Finance', 1100);
INSERT Major (Code, Description, MinSAT) VALUES ('MATH','Math', 1300);
INSERT Major (Code, Description, MinSAT) VALUES ('ENG','Engineering', 1350);
INSERT Major (Code, Description, MinSAT) VALUES ('EDUC','Education', 900);
INSERT Major (Code, Description, MinSAT) VALUES ('GENS','General Studies', 500);

create table Student (
	Id int primary key auto_increment,
	Firstname varchar(30) not null,
	Lastname varchar(30) not null,
	StateCode varchar(2) not null default 'OH',
	SAT int,
	GPA decimal(4,2) not null,
	MajorId int,
	foreign key (MajorId) references Major(Id)
);

-- Student: Sample data
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Eric','Ephram',		'OH',1200,3.0,(SELECT Id from Major where Code = 'GENB'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Greg','Gould',		'OH',1100,2.5,(SELECT Id from Major where Code = 'EDUC'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Adam','Ant',			'OH',1300,3.2,null);
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Howard','Hess',		'OH',1600,3.7,(SELECT Id from Major where Code = 'ENG'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Charles','Caldwell',	'OH',900,2.1,(SELECT Id from Major where Code = 'GENS'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('James','Joyce',		'OH',1100,2.5,null);
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Doug','Dumas',		'OH',1350,3.1,(SELECT Id from Major where Code = 'FIN'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Kevin','Kraft',		'OH',1000,2.7,(SELECT Id from Major where Code = 'FIN'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Frank','Fountain',	'OH',1000,2.5,(SELECT Id from Major where Code = 'ACCT'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Brian','Biggs',		'OH',950,2.3,(SELECT Id from Major where Code = 'GENB'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Jenny', 'Burgess','KY',983,2.00,(SELECT Id from Major where Code = 'ENG'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Alexandra', 'Johnson','OH',916,2.30,(SELECT Id from Major where Code = 'ENG'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Carol', 'Henderson','OH',1155,2.60,(SELECT Id from Major where Code = 'FIN'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Darin', 'Graves','KY',994,3.90,(SELECT Id from Major where Code = 'GENB'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Bertha', 'West','OH',1205,2.60,(SELECT Id from Major where Code = 'GENB'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Albert', 'Parks','KY',1078,2.00,(SELECT Id from Major where Code = 'GENS'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Sherman', 'King','PA',1495,2.80,NULL);
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Marion', 'Baker','TN',827,2.70,(SELECT Id from Major where Code = 'ACCT'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Julie', 'Steele','OH',1224,2.60,(SELECT Id from Major where Code = 'GENS'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Pete', 'Cooper','OH',1341,3.30,(SELECT Id from Major where Code = 'EDUC'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Levi', 'Holt','IN',1494,2.20,(SELECT Id from Major where Code = 'FIN'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('William', 'Spencer','KY',1010,3.10,(SELECT Id from Major where Code = 'ENG'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Delbert', 'Erickson','IN',1205,2.30,(SELECT Id from Major where Code = 'ACCT'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Caroline', 'Castro','IN',1301,2.80,(SELECT Id from Major where Code = 'EDUC'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Krystal', 'Waters','OH',895,3.40,(SELECT Id from Major where Code = 'MATH'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Jacob', 'Norman','KY',1346,3.50,(SELECT Id from Major where Code = 'EDUC'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Jessica', 'Rice','IN',924,3.50,(SELECT Id from Major where Code = 'GENS'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Bryan', 'Rose','OH',1272,4.00,(SELECT Id from Major where Code = 'ENG'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Cary', 'Powell','IN',898,3.50,(SELECT Id from Major where Code = 'FIN'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Lois', 'Ruiz','KY',1266,4.00,(SELECT Id from Major where Code = 'GENS'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Jordan', 'Rodgers','KY',1548,2.80,NULL);
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('May', 'Harrison','OH',1053,2.70,(SELECT Id from Major where Code = 'ENG'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Jennie', 'Salazar','KY',1143,3.20,(SELECT Id from Major where Code = 'GENS'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Elbert', 'Duncan','IL',860,2.80,(SELECT Id from Major where Code = 'ENG'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Juanita', 'Hansen','IL',1119,2.10,(SELECT Id from Major where Code = 'GENB'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Viola', 'Bridges','TN',1179,3.40,(SELECT Id from Major where Code = 'FIN'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Ron', 'Wells','TN',1191,3.10,(SELECT Id from Major where Code = 'GENS'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Meghan', 'Ward','TN',1482,2.00,(SELECT Id from Major where Code = 'MATH'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Deanna', 'Pope','MI',1545,3.50,NULL);
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Ed', 'Ball','TN',1108,2.50,(SELECT Id from Major where Code = 'ACCT'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Jason', 'Swanson','PA',947,2.60,(SELECT Id from Major where Code = 'ENG'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Dave', 'Luna','MI',1345,2.70,(SELECT Id from Major where Code = 'MATH'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Rita', 'Schneider','IN',1012,2.00,(SELECT Id from Major where Code = 'MATH'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Rolando', 'Dean','OH',994,3.10,(SELECT Id from Major where Code = 'GENB'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Andy', 'Edwards','OH',1394,3.10,(SELECT Id from Major where Code = 'ACCT'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Bonnie', 'Ortega','OH',1473,4.00,(SELECT Id from Major where Code = 'GENB'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Russell', 'Cobb','IN',1312,2.00,NULL);
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Al', 'Vaughn','IN',1201,2.70,(SELECT Id from Major where Code = 'FIN'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Sandra', 'Mendez','OH',898,2.90,(SELECT Id from Major where Code = 'GENS'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Caleb', 'Mckenzie','KY',952,3.60,(SELECT Id from Major where Code = 'FIN'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Danny', 'Foster','KY',1365,2.90,(SELECT Id from Major where Code = 'ACCT'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Melvin', 'Wilkins','PA',1464,4.00,(SELECT Id from Major where Code = 'ENG'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Ramon', 'Mendoza','TN',1415,3.30,(SELECT Id from Major where Code = 'EDUC'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Jeffrey', 'Warren','PA',1044,2.10,(SELECT Id from Major where Code = 'MATH'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Margaret', 'Lloyd','MI',1063,3.90,NULL);
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Ken', 'Young','MI',1295,2.10,(SELECT Id from Major where Code = 'GENS'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Lillian', 'Yates','TN',1106,2.60,(SELECT Id from Major where Code = 'GENS'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Georgia', 'Hale','MI',801,4.00,(SELECT Id from Major where Code = 'FIN'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Megan', 'Collier','TN',1489,3.00,(SELECT Id from Major where Code = 'GENS'));
INSERT Student (firstname, lastname, statecode, sat, gpa, majorid) VALUES('Jessica', 'Patrick','IL',1452,2.60,(SELECT Id from Major where Code = 'ACCT'));

create table Instructor (
	Id int primary key auto_increment,
	Firstname varchar(30) not null,
	Lastname varchar(30) not null,
	YearsExperience int not null default 0,
	IsTenured bit not null default 0
);
-- Instructor: Sample data
INSERT Instructor (firstname, lastname, yearsexperience, istenured) VALUES ('Joe','Downey',10,1);
INSERT Instructor (firstname, lastname, yearsexperience, istenured) VALUES ('Jane','Jones',6,1);
INSERT Instructor (firstname, lastname, yearsexperience, istenured) VALUES ('Bill','Tensi',3,0);
INSERT Instructor (firstname, lastname, yearsexperience, istenured) VALUES ('Sherry','Nagy',14,1);
INSERT Instructor (firstname, lastname, yearsexperience, istenured) VALUES ('Frank','Schell',23,1);
INSERT Instructor (firstname, lastname, yearsexperience, istenured) VALUES ('Michelle','Bellman',35,1);
INSERT Instructor (firstname, lastname, yearsexperience, istenured) VALUES ('George','Hunt',2,0);
INSERT Instructor (firstname, lastname, yearsexperience, istenured) VALUES ('Amy','Brock',7,0);
INSERT Instructor (firstname, lastname, yearsexperience, istenured) VALUES ('Larry','Seger',11,1);
INSERT Instructor (firstname, lastname, yearsexperience, istenured) VALUES ('Kathy','Miller',21,1);

-- set @downey = null;
set @downey = (select Id From Instructor where Lastname = 'Downey');
set @jones = (select Id From Instructor where Lastname = 'Jones');
set @tensi = (select Id From Instructor where Lastname = 'Tensi');
set @nagy = (select Id From Instructor where Lastname = 'Nagy');
set @schell = (select Id From Instructor where Lastname = 'Schell');
set @bellman = (select Id From Instructor where Lastname = 'Bellman');
set @hunt = (select Id From Instructor where Lastname = 'Hunt');
set @brock = (select Id From Instructor where Lastname = 'Brock');
set @seger = (select Id From Instructor where Lastname = 'Seger');
set @miller = (select Id From Instructor where Lastname = 'Miller');

create table Class (
	Id int primary key auto_increment,
	Code varchar(6) not null,
	Subject varchar(30) not null,
	Section int not null,
	InstructorId int,
	foreign key (InstructorId) references Instructor(Id)
);
INSERT class (Code, Subject,Section,InstructorId) VALUES('ENG101','English',101,@downey);
INSERT class (Code, Subject,Section,InstructorId) VALUES('ENG102','English',102,@downey);
INSERT class (Code, Subject,Section,InstructorId) VALUES('ENG103','English',103,@downey);
INSERT class (Code, Subject,Section,InstructorId) VALUES('ENG201','English',201,@downey);
INSERT class (Code, Subject,Section,InstructorId) VALUES('ENG202','English',202,@downey);
INSERT class (Code, Subject,Section,InstructorId) VALUES('ENG203','English',203,@downey);
INSERT class (Code, Subject,Section,InstructorId) VALUES('ENG301','English',301,@downey);
INSERT class (Code, Subject,Section,InstructorId) VALUES('ENG302','English',302,@downey);
INSERT class (Code, Subject,Section,InstructorId) VALUES('ENG303','English',303,@downey);

INSERT class (Code, Subject,Section,InstructorId) VALUES('MAT201','Math',201,@hunt);
INSERT class (Code, Subject,Section,InstructorId) VALUES('MAT202','Math',202,@hunt);
INSERT class (Code, Subject,Section,InstructorId) VALUES('MAT203','Math',203,@hunt);
INSERT class (Code, Subject,Section,InstructorId) VALUES('MAT204','Math',204,@hunt);
INSERT class (Code, Subject,Section,InstructorId) VALUES('MAT401','Math',401,@hunt);
INSERT class (Code, Subject,Section,InstructorId) VALUES('MAT402','Math',402,@hunt);
INSERT class (Code, Subject,Section,InstructorId) VALUES('MAT403','Math',403,@hunt);
INSERT class (Code, Subject,Section,InstructorId) VALUES('MAT404','Math',404,@hunt);

INSERT class (Code, Subject,Section,InstructorId) VALUES('HIS101','History',101,@miller);
INSERT class (Code, Subject,Section,InstructorId) VALUES('HIS201','History',201,@miller);
INSERT class (Code, Subject,Section,InstructorId) VALUES('HIS301','History',301,@miller);

INSERT class (Code, Subject,Section,InstructorId) VALUES('CSC311','Computer Science',311,@tensi);
INSERT class (Code, Subject,Section,InstructorId) VALUES('CSC312','Computer Science',312,@tensi);
INSERT class (Code, Subject,Section,InstructorId) VALUES('CSC313','Computer Science',313,@tensi);
INSERT class (Code, Subject,Section,InstructorId) VALUES('CSC441','Computer Science',441,@tensi);
INSERT class (Code, Subject,Section,InstructorId) VALUES('CSC442','Computer Science',442,@tensi);
INSERT class (Code, Subject,Section,InstructorId) VALUES('CSC443','Computer Science',443,@tensi);

INSERT class (Code, Subject,Section,InstructorId) VALUES('PSY101','Psychology',101,@brock);
INSERT class (Code, Subject,Section,InstructorId) VALUES('PSY102','Psychology',102,@brock);
INSERT class (Code, Subject,Section,InstructorId) VALUES('PSY231','Psychology',231,@brock);
INSERT class (Code, Subject,Section,InstructorId) VALUES('PSY232','Psychology',232,@brock);

INSERT class (Code, Subject,Section,InstructorId) VALUES('EDU221','Education',221,@schell);
INSERT class (Code, Subject,Section,InstructorId) VALUES('EDU222','Education',222,@schell);
INSERT class (Code, Subject,Section,InstructorId) VALUES('EDU223','Education',223,@schell);
INSERT class (Code, Subject,Section,InstructorId) VALUES('EDU351','Education',351,@schell);
INSERT class (Code, Subject,Section,InstructorId) VALUES('EDU352','Education',352,@schell);
INSERT class (Code, Subject,Section,InstructorId) VALUES('EDU353','Education',353,@schell);

create table Assignment (
	Id int primary key auto_increment,
	Description varchar(30) not null,
	ClassId int not null,
	foreign key (ClassId) references Class(Id)
);

create table MajorClass (
	Id int primary key auto_increment,
	MajorId int not null,
	ClassId int not null,
	foreign key (MajorId) references Major(Id),
	foreign key (ClassId) references Class(Id)
);
set @genbus = 'GENB';
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @genbus),
	(SELECT Id From Class Where Code = 'ENG101'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @genbus),
	(SELECT Id From Class Where Code = 'MAT201'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @genbus),
	(SELECT Id From Class Where Code = 'HIS101'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @genbus),
	(SELECT Id From Class Where Code = 'CSC311'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @genbus),
	(SELECT Id From Class Where Code = 'PSY101'));

set @acct = 'ACCT';
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @acct),
	(SELECT Id From Class Where Code = 'ENG101'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @acct),
	(SELECT Id From Class Where Code = 'MAT201'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @acct),
	(SELECT Id From Class Where Code = 'MAT202'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @acct),
	(SELECT Id From Class Where Code = 'CSC311'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @acct),
	(SELECT Id From Class Where Code = 'CSC312'));

set @fin = 'FIN';
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @fin),
	(SELECT Id From Class Where Code = 'ENG101'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @fin),
	(SELECT Id From Class Where Code = 'MAT201'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @fin),
	(SELECT Id From Class Where Code = 'MAT202'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @fin),
	(SELECT Id From Class Where Code = 'MAT203'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @fin),
	(SELECT Id From Class Where Code = 'CSC311'));

set @math = 'MATH';
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @math),
	(SELECT Id From Class Where Code = 'ENG101'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @math),
	(SELECT Id From Class Where Code = 'MAT201'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @math),
	(SELECT Id From Class Where Code = 'MAT202'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @math),
	(SELECT Id From Class Where Code = 'MAT203'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @math),
	(SELECT Id From Class Where Code = 'MAT401'));

set @eng = 'ENG';
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @eng),
	(SELECT Id From Class Where Code = 'ENG101'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @eng),
	(SELECT Id From Class Where Code = 'MAT201'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @eng),
	(SELECT Id From Class Where Code = 'MAT202'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @eng),
	(SELECT Id From Class Where Code = 'MAT203'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @eng),
	(SELECT Id From Class Where Code = 'MAT401'));

set @educ = 'EDUC';
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @educ),
	(SELECT Id From Class Where Code = 'ENG101'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @educ),
	(SELECT Id From Class Where Code = 'MAT201'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @educ),
	(SELECT Id From Class Where Code = 'HIS101'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @educ),
	(SELECT Id From Class Where Code = 'EDU221'));
INSERT MajorClass (MajorId, ClassId) VALUES (
	(SELECT Id From Major Where Code = @educ),
	(SELECT Id From Class Where Code = 'EDU222'));

create table StudentClass (
	Id int primary key auto_increment,
	StudentId int not null,
	ClassId int not null,
	ClassGradeValue varchar(3),
	foreign key (StudentId) references Student(Id),
	foreign key (ClassId) references Class(Id),
	foreign key (ClassGradeValue) references ClassGrade(Grade)
);

INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Ant'),
	(SELECT Id from Class Where Code = 'ENG101'), 'B+');
INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Ant'),
	(SELECT Id from Class Where Code = 'MAT201'), 'B-');
INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Ant'),
	(SELECT Id from Class Where Code = 'HIS101'), 'A-');
INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Ant'),
	(SELECT Id from Class Where Code = 'PSY101'), 'B');
INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Ant'),
	(SELECT Id from Class Where Code = 'CSC311'), 'C+');

INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Biggs'),
	(SELECT Id from Class Where Code = 'ENG103'), 'A');
INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Biggs'),
	(SELECT Id from Class Where Code = 'MAT203'), 'A-');
INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Biggs'),
	(SELECT Id from Class Where Code = 'EDU221'), 'C+');
INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Biggs'),
	(SELECT Id from Class Where Code = 'PSY231'), 'B');

	
INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Kraft'),
	(SELECT Id from Class Where Code = 'MAT402'), 'A');
INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Kraft'),
	(SELECT Id from Class Where Code = 'CSC441'), 'A-');
INSERT StudentClass (StudentId, ClassId, ClassGradeValue) VALUES (
	(SELECT Id from Student Where Lastname = 'Kraft'),
	(SELECT Id from Class Where Code = 'CSC313'), 'B+');

