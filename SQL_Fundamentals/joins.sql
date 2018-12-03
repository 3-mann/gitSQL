SELECT * 
FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE department_id = 60);  -- 4200, 6000, 9000

-- > ANY  --  > MIN
-- < ANY  --  < MAX
-- = ANY  --  IN
-- <>ANY  --  ???  1,2

SELECT * 
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 60); -- 4200, 6000, 9000

-- > ALL  --  > MAX
-- < ALL  --  < MIN
-- = ALL  --  ???
-- <>ALL  --  NOT IN

SELECT * FROM employees;

-- "department_id = 50" 
SELECT * FROM departments WHERE department_id = 50;


SELECT * 
FROM   employees, departments
WHERE  employees.department_id = departments.department_id;
-- ORA-00918: column ambiguously defined

-- "Oracle" Syntax
SELECT employee_id, last_name, salary, e.department_id, department_name 
FROM   employees e, departments d
WHERE  e.department_id = d.department_id
AND    salary < 10000;

-- ANSI "SQL-99" Syntax
SELECT employee_id, last_name, salary, e.department_id, department_name 
FROM   employees e JOIN departments d
ON     e.department_id = d.department_id
AND    salary < 10000;

SELECT employee_id, last_name, salary, e.department_id, department_name 
FROM   employees e JOIN departments d
ON     e.department_id = d.department_id
WHERE  salary < 10000;


-- "Oracle" Syntax
SELECT employee_id, last_name, salary, e.department_id, department_name, city 
FROM   employees e, departments d, locations l
WHERE  e.department_id = d.department_id
AND    d.location_id = l.location_id
AND    salary < 10000;

-- ANSI "SQL-99" Syntax
SELECT employee_id, last_name, salary, e.department_id, department_name, city 
FROM   employees e JOIN departments d ON e.department_id = d.department_id
                   JOIN locations l   ON d.location_id = l.location_id
AND    salary < 10000;

SELECT employee_id, last_name, salary, e.department_id, department_name, city
FROM   employees e JOIN departments d ON e.department_id = d.department_id
                   JOIN locations l   ON d.location_id = l.location_id
WHERE  salary < 10000;

SELECT employee_id, last_name, salary, department_id, department_name, city 
FROM   employees e JOIN departments d USING(department_id)
                   JOIN locations l   USING(location_id)
WHERE  salary < 10000;

SELECT employee_id, last_name, salary, department_id, department_name
FROM   employees e INNER JOIN departments d USING(department_id);

SELECT employee_id, last_name, salary, e.department_id, department_name
FROM   employees e INNER JOIN departments d ON e.department_id = d.department_id;

SELECT employee_id, last_name, salary, e.department_id, department_name
FROM   employees e LEFT OUTER JOIN departments d ON e.department_id = d.department_id;

SELECT employee_id, last_name, salary, d.department_id, department_name
FROM   departments d RIGHT OUTER JOIN employees e  ON e.department_id = d.department_id;

SELECT employee_id, last_name, salary, d.department_id, department_name
FROM   employees e RIGHT OUTER JOIN departments d ON e.department_id = d.department_id;

SELECT employee_id, last_name, salary, d.department_id, department_name
FROM   employees e FULL OUTER JOIN departments d ON e.department_id = d.department_id;


SELECT employee_id, last_name, salary, department_name
FROM   employees e, departments d;

SELECT employee_id, last_name, salary, department_name
FROM   employees e CROSS JOIN departments d;


SELECT employee_id, last_name, salary, department_id, department_name, city 
FROM   employees e LEFT OUTER JOIN departments d USING(department_id)
                   LEFT OUTER JOIN locations l   USING(location_id);

SELECT employee_id, last_name, salary, department_id, department_name, city 
FROM   departments d RIGHT OUTER JOIN employees e USING(department_id)
                     LEFT OUTER JOIN locations l  USING(location_id);
