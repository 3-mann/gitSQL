-- "ranking" (für ORA21)
SELECT RANK() OVER(ORDER BY salary DESC) rank, last_name, salary 
FROM employees 
ORDER BY salary DESC;


-- "ranking by departments" (für ORA21)
SELECT RANK() OVER(PARTITION BY (department_id) ORDER BY salary DESC) rank, last_name, salary, department_id
FROM employees 
ORDER BY department_id, salary DESC;