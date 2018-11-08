drop  PACKAGE error_pkg;
drop PACKAGE constant_pkg;
drop PROCEDURE employee_sal;
drop PROCEDURE add_dept;
drop TABLE usage;
drop TABLE txn;
drop PROCEDURE log_usage;
drop PROCEDURE bank_trans;
drop FUNCTION f2;
drop  FUNCTION get_hire_date;
drop PROCEDURE update_salary;
drop PROCEDURE raise_salary;
drop PROCEDURE get_departments;
ALTER TRIGGER update_job_history DISABLE;
UPDATE employees SET salary= 12008 where employee_id=108;

