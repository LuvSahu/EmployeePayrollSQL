--------UC5 retrive accoring to data and particular employee-----
SELECT * FROM  employee_payroll where Name='Luv' or Name='Sahu';
----------to get the d/f colum-------
SELECT * FROM  employee_payroll where Name='Luv' or Salary=50002;

----------------UC5 retrive according to the start date range-------------
SELECT * FROM  employee_payroll where StartDate between CAST('2012-04-01' as date) and GETDATE();