DROP TRIGGER check_salary;
DROP TRIGGER logon_trig;
DROP TRIGGER logoff_trig;
DROP TRIGGER log_employee;
DROP TRIGGER salary_check;

UPDATE employees
SET salary = 3200
WHERE last_name = 'Stiles';

DROP TABLE log_trig_table;
DROP PROCEDURE log_execution;
