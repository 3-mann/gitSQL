WITH CNT_DEPT AS
(
SELECT department_id,
COUNT(1) NUM_EMP
FROM EMPLOYEES
WHERE department_id IN (10,20,90)
GROUP BY department_id
)
SELECT employee_id, e.department_id ,
TRUNC(SALARY/NUM_EMP) 
FROM EMPLOYEES E
JOIN CNT_DEPT C
ON (e.department_id = c.department_id)
/
