SELECT employee_id, job_id, 'Current' 
FROM employees
UNION
SELECT employee_id, job_id, 'Archived' 
FROM employees
ORDER BY 2; 
