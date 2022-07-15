------------UC6-we have to add the other column as a gender tocexisting table------------
ALTER TABLE employee_payroll
ADD Gender char(1); 
UPDATE employee_payroll set Gender='M';
UPDATE employee_payroll set Salary=60000 where Name='Deepak';
UPDATE employee_payroll set Salary=85000 where Name='Luv';

UPDATE employee_payroll set Salary=60001,StartDate=getdate() where Name='Atul';