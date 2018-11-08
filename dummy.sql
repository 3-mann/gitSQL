SELECT dummy, employee_id, last_name, salary, department_id  
FROM (
SELECT 1 dummy, employee_id, last_name, salary, department_id  FROM employees WHERE department_id=10
UNION
SELECT 2, employee_id, last_name, salary, department_id FROM employees WHERE department_id=50
UNION
SELECT 3, employee_id, last_name, salary, department_id FROM employees WHERE department_id=20 )
ORDER BY dummy 
/
