SELECT department_id,LISTAGG(last_name, ',') 
WITHIN GROUP (ORDER BY last_name) AS emp
FROM employees
GROUP BY department_id;

