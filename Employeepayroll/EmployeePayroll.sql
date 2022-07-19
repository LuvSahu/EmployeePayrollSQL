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

-------------UC9 Extend the employee table----------------
ALTER TABLE employee_payroll ADD BasicSalary float,Deductions float,TaxablePay float,IncomeTax float,NetPay float;

--------------UC10 ability to make same employee for the two different department-----------
SELECT* FROM  employee_payroll;
UPDATE employee_payroll set Department='IT', Address ='Gurgaon',BasicSalary=556786, Deductions=200,TaxablePay=3000 where Name='Luv';
UPDATE employee_payroll set Department='Software', Address ='Bengaluru',BasicSalary=456796, Deductions=300,TaxablePay=2000 where Name='Deepak';
UPDATE employee_payroll set Department='UPSC',Address ='Dehli',BasicSalary=356786, Deductions=270,TaxablePay=3000 where Name='Rohit';
UPDATE employee_payroll set Department='Devops',Address ='Noida',BasicSalary=459786, Deductions=280,TaxablePay=3000 where Name='Atul';
UPDATE employee_payroll set Department='Sales', Address ='Gurgaon',BasicSalary=456786, Deductions=200,TaxablePay=3000 where Name='Shubham';
UPDATE employee_payroll set Department='Sales', Address ='Bhiwadi',BasicSalary=456786, Deductions=200,TaxablePay=3000 where Name='Suraj';
-----INSERTING ONE MORE ROW WITH SAME EMPLOYEE DETAILS-----------------

INSERT INTO employee_payroll(Name,Salary,StartDate,Gender,PhoneNumber,Department,Address,BasicSalary,Deductions,TaxablePay,IncomeTax,NetPay)
VALUES('Sandeep',50002,'2008-02-02','M',5436787654,'Marketing','Mysore',4567860,200,3000,8765,600000);

-------UC11-creating the new tables for many to many relation-----------------
CREATE TABLE EmployeeDeparmentt(
DeptId int identity(1,1) PRIMARY KEY,

EmployeeID int FOREIGN KEY REFERENCES employee_payroll(Id));
SELECT* FROM  EmployeeDeparmentt;
INSERT INTO EmployeeDeparmentt(EmployeeID) values(1);
INSERT INTO EmployeeDeparmentt(EmployeeID) values(2);
INSERT INTO EmployeeDeparmentt(EmployeeID) values(3);
INSERT INTO EmployeeDeparmentt(EmployeeID) values(4);
INSERT INTO EmployeeDeparmentt(EmployeeID) values(5);
INSERT INTO EmployeeDeparmentt(EmployeeID) values(6);

create table payroll
(
	Payroll_ID int not null primary key,
	Basic_Pay money not null,
	Deduction float not null,
	Taxable real, 
	Income_Tax float,
	Netpay real, 
)

insert into payroll values
	(101,800000,2200.20,6000,50000,25000),
	(102,900000,6600.20,4000,70000,55000),
	(103,700000,7700.20,5000,70000,55000),
	(104,600000,9900.10,3000,80000,56000)

select *from payroll

create table Company
(
	Company_ID int primary key,
	ComapnyName varchar(20)
)

insert into Company values
	(801,'Atotech'),
	(802,'Google'),
	(803,'IBM'),
	(804,'MINDTREE')

select * from Company

create table Employee
(
	Employee_ID int not null primary key,
	Name varchar(20) not null,
	Gender varchar(1) not null,
	Basic_pay money not null,
	StartDate date not null,
	PhoneNumber varchar(10),
	Addres varchar(60),
	CompanyEmployeeID int FOREIGN KEY REFERENCES Company(Company_ID),
	PayrolID int FOREIGN KEY  REFERENCES Payroll(Payroll_ID)
)

insert into Employee values
	(001,'Luv','M',700000,'2018-07-11','8502012867','Gurguram',801,101),
	(002,'Rohit','M',800000,'2021-09-05','8502018567','Alwar',802,102),
	(003,'Priyanka','F',600000,'2019-08-09','7894561238','Ajmer',803,103),
	(004,'Sachin','M',900000,'2018-07-05','9632587417','Dehli',804,104);

select * from Employee

-----------UC12-checking with UC-4,5,7----------
SELECT* FROM  employee_payroll;



SELECT SUM(Salary) as TotalSalary from employee_payroll;
SELECT avg(Salary) as AvergeSalary from employee_payroll;
SELECT  MIN(Salary) as MINIMUMSalary from employee_payroll;
SELECT MAX(Salary) as MaximumSalary from employee_payroll;
SELECT COUNT(Salary) from employee_payroll;



