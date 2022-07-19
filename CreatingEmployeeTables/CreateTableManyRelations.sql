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
