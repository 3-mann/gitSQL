SELECT	dept.location_id, emp.last_name, emp.job_id, 
        emp.department_id, dept.department_id
FROM	departments dept JOIN employees emp
ON      emp.department_id = dept.department_id
ORDER BY dept.location_id, emp.last_name
/
