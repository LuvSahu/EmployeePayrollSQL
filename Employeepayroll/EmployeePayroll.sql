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

------------UC7-sum,avrage,min,max,count-------------------
SELECT * FROM  employee_payroll;
SELECT SUM(Salary) as TotalSalary from employee_payroll;
SELECT avg(Salary) as AvergeSalary from employee_payroll;
SELECT  MIN(Salary) as MINIMUMSalary from employee_payroll;
SELECT MAX(Salary) as MaximumSalary from employee_payroll;
SELECT COUNT(Salary) from employee_payroll;

------TO GET THE MINIMUM SALARY WITH MINIMUM SALARY------------
SELECT * FROM employee_payroll Salary where
 Salary=(select min(Salary)as MINIMUMSALARY FROM employee_payroll);

 SELECT * FROM employee_payroll Salary where
 Salary=(select MAX(Salary)as MAXIMUMSALARY FROM employee_payroll);

 SELECT Name,StartDate FROM employee_payroll Salary where
 Salary=(select MAX(Salary)as MAXIMUMSALARY FROM employee_payroll);

 --------TO count the male and female separetly to all the employee-------
 SELECT COUNT(Salary)  from employee_payroll group by gender;
 -----------we also displaying the gender column-------------
 SELECT COUNT(Salary) as GenderCount,gender from employee_payroll group by gender;
  --------TO count the male and female separetly to particular the employee-------

  --------UC8-Extending the table bye by adding dept,phonr,address columns---------
ALTER TABLE employee_payroll
ADD PhoneNumber bigint;
 --while adding not null we have to pass default values because we are altering it----------
ALTER TABLE employee_payroll
ADD Department varchar(200)NOT NULL default'IT';
 
select * from employee_payroll;

ALTER TABLE employee_payroll
ADD Address varchar(200) default 'Dehli';

