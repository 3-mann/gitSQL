SELECT employee_id, last_name, hire_date, department_id, salary, &&col
FROM   employees
WHERE  department_id = &dep_id
ORDER BY &col;