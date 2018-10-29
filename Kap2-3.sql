-- 1
select * from departments;

select * 
from employees;

SELECT employee_id, last_name, salary
FROM   employees;

SELECT employee_id, 
       first_name || ' ' || last_name name, 
       salary, 
       commission_pct AS comm, 
       (salary*commission_pct+salary)*12 "Annual Salary"
FROM   employees;

SELECT department_name||'. Department''s manager is '||manager_id FROM departments;
SELECT department_name||q'(. Department's manager is )'||manager_id FROM departments;
SELECT department_name||q'<. Department's manager is >'||manager_id FROM departments;
SELECT department_name||q'!. Department's manager is !'||manager_id FROM departments;
SELECT department_name||q'A. Department's manager is A'||manager_id FROM departments;

SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;
SELECT DISTINCT department_id, job_id FROM employees;

DESCRIBE departments;
DESC employees;

-- Comments
/*
    Comments
*/
-- 2

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees;

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  department_id = 60;

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  last_name = 'King';

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  hire_date < '01-JAN-03';  -- DD-MON-RR

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  hire_date < '01.01.03';  

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  salary >= 6000;  

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  last_name > 'K';  

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
--WHERE  department_id <> 50;  
WHERE  department_id != 50;  

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  salary BETWEEN 6000 AND 11000;  

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  salary >= 6000 AND salary <= 11000;  

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  salary NOT BETWEEN 6000 AND 11000;  

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  salary < 6000 OR salary > 11000;  

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  department_id IN (10, 90, 30);

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  department_id = 10 
OR     department_id = 90
OR     department_id = 30;

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  department_id NOT IN (10, 90, 30);

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  department_id <> 10 
AND    department_id <> 90
AND    department_id <> 30;

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  last_name LIKE 'K%';

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  last_name LIKE '%s';

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  last_name LIKE '%i%';

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  last_name NOT LIKE '%i%';

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  last_name LIKE '_i%';

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  job_id LIKE '%\_R%' ESCAPE '\';

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  job_id LIKE '%*_R%' ESCAPE '*';

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  department_id IS NULL;

SELECT employee_id, last_name, hire_date, salary, job_id, department_id
FROM   employees
WHERE  commission_pct IS NOT NULL;

SELECT employee_id, last_name, hire_date, salary*12 ann_sal, job_id, department_id
FROM   employees
WHERE  ann_sal > 100000; 
-- ORA-00904: "ANN_SAL": ungültiger Bezeichner

SELECT employee_id, last_name, hire_date, salary*12 ann_sal, job_id, department_id
FROM   employees
WHERE  salary*12 > 100000; 

-- ORDER BY

SELECT employee_id, last_name, hire_date, salary*12 ann_sal, job_id, department_id
FROM   employees
WHERE  salary*12 > 100000
ORDER BY ann_sal; 

SELECT employee_id, last_name, hire_date, salary*12 ann_sal, job_id, department_id
FROM   employees
WHERE  salary*12 > 100000
ORDER BY salary*12;

SELECT employee_id, last_name, hire_date, salary*12 ann_sal, job_id, department_id
FROM   employees
WHERE  salary*12 > 100000
ORDER BY 4; 

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
ORDER BY last_name;

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
ORDER BY last_name DESC;

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
ORDER BY department_id, salary;

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
ORDER BY department_id, salary DESC;

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
ORDER BY department_id DESC, salary ;

-- ROW LIMITING CLAUSE

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
FETCH FIRST 5 ROWS ONLY;

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
OFFSET 5 ROWS;

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
OFFSET 5 ROWS            -- ROW/ROWS
FETCH FIRST 5 ROWS ONLY; -- FIRST/NEXT

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
FETCH FIRST 10 PERCENT ROWS ONLY; 

/*Top-5 by salary*/
SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
ORDER BY salary DESC
FETCH FIRST 5 ROWS ONLY;

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
ORDER BY salary
FETCH FIRST 8 ROWS WITH TIES;

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
ORDER BY department_id
FETCH FIRST 4 ROWS WITH TIES;


-- Substitutionsvariable "&"

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
WHERE  department_id = &dep_id;

SELECT employee_id, last_name, hire_date, department_id, salary
FROM   employees
WHERE  last_name = '&name';

SELECT employee_id, last_name, hire_date, department_id, salary, &col
FROM   employees
ORDER BY &col;

SELECT employee_id, last_name, hire_date, department_id, salary, &&col
FROM   employees
ORDER BY &col;

DEFINE dep_id = 50
DEFINE dep_id
DEFINE ;

SELECT employee_id, last_name, hire_date, department_id, salary, &&col
FROM   employees
WHERE  department_id = &dep_id
ORDER BY &col;

UNDEFINE col dep_id

DEFINE