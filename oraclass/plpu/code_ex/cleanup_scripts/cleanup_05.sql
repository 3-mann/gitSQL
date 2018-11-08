drop PACKAGE dept_pkg;
delete FROM departments
WHERE department_id = 980;
delete FROM departments
WHERE department_name = 'Training' and Location_id = 2400;
drop PACKAGE taxes_pkg;
drop PACKAGE curs_pkg;
drop PACKAGE emp_pkg;