--------UC8-Extending the table bye by adding dept,phonr,address columns---------
ALTER TABLE employee_payroll
ADD PhoneNumber bigint;
 --while adding not null we have to pass default values because we are altering it----------
ALTER TABLE employee_payroll
ADD Department varchar(200)NOT NULL default'IT';
 
select * from employee_payroll;

ALTER TABLE employee_payroll
ADD Address varchar(200) default 'Dehli';