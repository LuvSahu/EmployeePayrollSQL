--------Create Database-----
create database payroll_service;


use payroll_service;

----Create table------
CREATE TABLE employee_payroll (
    Id int identity(1,1) PRIMARY KEY,
	--first 1 = it should be start with first row and second indicate 1 = increment by 1---
    Name varchar(200),
    Salary float,
    StartDate datetime,
   
);

---------to insert data into the table UC3--------------
INSERT INTO employee_payroll
VALUES('Luv',50002,'2010-02-02'),('Atul',50003,'2012-04-01');

INSERT INTO employee_payroll(Name,StartDate)
VALUES('Deepak','2021-02-02'),('Rohit','2019-07-01');

-----retrive data UC4---------
SELECT * FROM  employee_payroll;--to retrive all the data---------
SELECT Id,Name FROM  employee_payroll;------to retrive id and name-----------

--------UC5 retrive accoring to data and particular employee-----
SELECT * FROM  employee_payroll where Name='Luv' or Name='Sahu';
----------to get the d/f colum-------
SELECT * FROM  employee_payroll where Name='Luv' or Salary=50002;

----------------UC5 retrive according to the start date range-------------
SELECT * FROM  employee_payroll where StartDate between CAST('2012-04-01' as date) and GETDATE();

------------UC6-we have to add the other column as a gender tocexisting table------------
ALTER TABLE employee_payroll
ADD Gender char(1); 
UPDATE employee_payroll set Gender='M';
UPDATE employee_payroll set Salary=60000 where Name='Deepak';
UPDATE employee_payroll set Salary=85000 where Name='Luv';

UPDATE employee_payroll set Salary=60001,StartDate=getdate() where Name='Atul';