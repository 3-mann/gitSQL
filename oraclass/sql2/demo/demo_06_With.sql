WITH avgsal_tab
AS (SELECT avg(salary) avgsal FROM employees)
SELECT last_name, salary, avgsal avsal
FROM employees, avgsal_tab
WHERE salary > avgsal ;
