--------------UC10 ability to make same employee for the two different department-----------
SELECT* FROM  employee_payroll;
UPDATE employee_payroll set Department='IT', Address ='Gurgaon',BasicSalary=556786, Deductions=200,TaxablePay=3000 where Name='Luv';
UPDATE employee_payroll set Department='Software', Address ='Bengaluru',BasicSalary=456796, Deductions=300,TaxablePay=2000 where Name='Deepak';
UPDATE employee_payroll set Department='UPSC',Address ='Dehli',BasicSalary=356786, Deductions=270,TaxablePay=3000 where Name='Rohit';
UPDATE employee_payroll set Department='Devops',Address ='Noida',BasicSalary=459786, Deductions=280,TaxablePay=3000 where Name='Atul';
UPDATE employee_payroll set Department='Sales', Address ='Gurgaon',BasicSalary=456786, Deductions=200,TaxablePay=3000 where Name='Luv';
UPDATE employee_payroll set Department='Sales', Address ='Bhiwadi',BasicSalary=456786, Deductions=200,TaxablePay=3000 where Name='Rohit';
-----INSERTING ONE MORE ROW WITH SAME EMPLOYEE DETAILS-----------------

INSERT INTO employee_payroll(Name,Salary,StartDate,Gender,PhoneNumber,Department,Address,BasicSalary,Deductions,TaxablePay,IncomeTax,NetPay)
VALUES('Luv',50002,'2008-02-02','M',5436787654,'Devops','Berlin',4567860,200,3000,8765,600000);