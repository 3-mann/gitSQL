SELECT e.last_name "EMP NAME", m.last_name "MGR NAME" FROM employees e
join employees m
ON e.manager_id = m.employee_id;

--A. only inner JOIN
--B. only FULL OUTER JOIN
--C. only LEFT OUTER JOIN
--D. only RIGHT OUTER JOIN

SELECT department_id "Dept.",
       LISTAGG(last_name, '; ') WITHIN GROUP (ORDER BY hire_date) "Employees"
  FROM employees
  GROUP BY department_id
  ORDER BY department_id 
  ; 
  
  alter user sh identified by sh account unlock;
  
  desc employees;


  
Select last_name Nachname
, job_id Job
, to_char(hire_date,'fmDay, Month YYYY') Einstellungsdatum
, '$'||salary Monatsgehalt
, employee_id "Employee Nr."
from employees Order by salary DESC;


Select last_name, job_id, hire_date, to_Char(hire_date,'YYYY')
From employees
Where to_char(hire_date,'YYYY') between '2001' and '2003'
Order by hire_date;

SELECT last_name, job_id, hire_date
FROM employees
WHERE hire_date between '01.01.2001' AND '31.12.2003';

SELECT last_name, job_id, hire_date FROM employees 
WHERE hire_date BETWEEN 2000 AND 2003
ORDER BY hire_date ;

Select last_name  ||  ', ('  ||  job_id  ||  ')' "Employee and Job Title"
    , Substr(first_name,1,1)||'.'||Substr(last_name,1,1)||'.'
from employees
Where (job_id = 'SA_REP' or job_id = 'ST_CLERK')
And Substr(last_name,2,1) = 'a';

SELECT last_name ||',  ' || job_id || ' SUPI!' "Employee and Job Title"
  FROM employees
  WHERE ( 
        job_id = 'SA_REP'
        OR job_id ='ST_CLERK'
        )
  AND last_name Like '_a%';


Select last_name Employees, salary "Monthly Salary", department_id
from employees 
where salary * 12 between 50000 and 100000
and department_id not in (20,50,80)
Order by last_name;

select distinct e.job_id, e.department_id, d.location_id from employees e, departments d
where e.department_id = d.department_id
and e.department_id = 80
order by job_id;


select e.job_id,  j.job_id from employees e left join job_history j
on e.hire_date > j.end_date;

Select e.last_name
    , d.department_name
    , d.location_id
    , l.city
    from employees e
        , departments d
        , locations l
    where e.department_id = d.department_id 
    and d.location_id = l.location_id
    and l.city = 'Oxford' 
    and e.commission_pct IS NOT NULL;








  
  