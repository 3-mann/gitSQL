--Ignore Any error messages while executing this cleanup script.
--The error messages may occur due to the restriction caused by triggers while performing UPDATE, INSERT and DELETE operations during Business hours.

DELETE from departments where department_id = 400;

UPDATE employees
SET salary = salary / 1.1
WHERE department_id = 30;

drop TRIGGER secure_emp;
drop TRIGGER secure_employees ;
drop TRIGGER restrict_salary;
drop TRIGGER audit_emp_values;
drop TRIGGER derive_commission_pct;
drop TRIGGER employee_dept_fk_trg;
drop TRIGGER new_emp_dept;

DELETE from employees where employee_id = 300;

UPDATE employees
SET salary = 14000
WHERE last_name = 'Russell';

DELETE from employees where employee_id = 999;

UPDATE employees 
SET department_id = 80 
WHERE employee_id = 170;
 
DROP table emp_details;
DROP table new_emps;
DROP table audit_emp;


