SELECT e.employee_id, e.salary, cnt_dept.num_emp , TRUNC(e.salary/cnt_dept.num_emp) 
FROM (
        SELECT department_id, COUNT(1) num_emp
        FROM employees
        GROUP BY department_id 
    ) cnt_dept, employees e 
WHERE e.department_id =cnt_dept.department_id 
ORDER BY e.department_id 
;
