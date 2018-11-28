SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM   employees
WHERE  department_id IS NOT NULL
GROUP BY department_id, job_id
UNION
SELECT department_id, NULL, COUNT(*), SUM(salary)
FROM   employees
WHERE  department_id IS NOT NULL
GROUP BY department_id
UNION
SELECT NULL, NULL, COUNT(*), SUM(salary)
FROM   employees
WHERE  department_id IS NOT NULL;

SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM   employees
WHERE  department_id IS NOT NULL
GROUP BY ROLLUP(department_id, job_id)
ORDER BY 1,2;

ROLLUP(n) -> n+1 Groups
ROLLUP(a,b,c) -> (a,b,c) (a,b) (a) ()

SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM   employees
WHERE  department_id IS NOT NULL
GROUP BY CUBE(department_id, job_id)
ORDER BY 1,2;

CUBE(n) -> 2**n
CUBE(a,b,c) -> (a,b,c) (a,b) (a,c) (b,c) (a) (b) (c) ()

SELECT department_id, job_id, manager_id, COUNT(*), SUM(salary)
FROM   employees
WHERE  department_id IS NOT NULL
GROUP BY GROUPING SETS((department_id, job_id), manager_id)
ORDER BY 1,2;