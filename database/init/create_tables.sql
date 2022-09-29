CREATE DATABASE memberssite_db;
use memberssite_db;
CREATE TABLE  department(
    department_id int NOT NULL PRIMARY KEY,
    depart_name varchar(256),
    member_id int );
CREATE TABLE  member_table(
    student_id int auto_increment PRIMARY KEY,
    member_name varchar(256),
    pass varchar(128),
    grade int,
    department_id int,
    INDEX DepartmentIndex(department_id),
    FOREIGN KEY fk_department(department_id)
    REFERENCES department(department_id));
CREATE TABLE Member_Language(
    StudentId int,
    INDEX LanguageIndex(StudentId),
    FOREIGN KEY fk_LanguageId(StudentId) REFERENCES member_table(student_Id)
);
CREATE TABLE Member_Project(
    StudentId int,
    LanguageID int,
    skill varchar(128),
    INDEX LanguageIndex(StudentId),
    FOREIGN KEY fk_LanguageId(StudentId) REFERENCES member_table(student_id)
);
create table Project(
	id int primary key,
    Project_name varchar(128),
    created date
    );
CREATE TABLE LanguageTable(
	LanguageId int NOT NULL PRIMARY KEY,
    LanguageName varchar(128)
);
create table Project_Language(
	LanguageId int,
    index Lid(LanguageId),
    foreign key(LanguageId)
    references LanguageTable(LanguageId),
    ProjectId int,
    index Pid(ProjectId),
    foreign key (ProjectId)
    references Project(id) 
    );