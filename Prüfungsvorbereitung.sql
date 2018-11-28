CREATE TABLE orders
(ord_no NUMBER(2) CONSTRAINT ord_pk PRIMARY KEY,
ord_date DATE,
cust_id NUMBER(4));

CREATE TABLE ord_items
(ord_no NUMBER(2),
item_no NUMBER(3),
qty NUMBER(3) CHECK (qty BETWEEN 100 AND 200),
expiry_date date CHECK (expiry_date > SYSDATE));
CONSTRAINT it_pk PRIMARY KEY (ord_no,item_no),
CONSTRAINT ord_fk FOREIGN KEY(ord_no) REFERENCES orders(ord_no));

rollback;

drop table orders purge;


select last_name, nvl2(hire_date,hire_date,'') from employees;
select last_name, nvl(hire_date,hire_date) from employees;

SELECT AVG(CASE    -- ####TODO:### ist noch nicht fertig ####
WHEN salary BETWEEN 0 AND 2000 AND promo_category='A' then salary
ELSE null END) "CAT_2000A",
AVG(CASE
WHEN salary BETWEEN 2001 AND 5000 AND promo_category='A' THEN salary
ELSE null END) "CAT_5000A"
FROM promotions;


SELECT TO_CHAR(sysdate,'dd-mon-yyyy hh24:mi:ss') d1,
TO_CHAR(sysdate,'$99999999D99') d2
FROM dual;
WHERE TO_NUMBER(TO_DATE(trans_date,'hh24')) < 12 AND COALESCE(trans_amt,NULL)
<>NULL


SELECT TO_CHAR(hire_date,'dd-mon-yyyy hh24:mi:ss') d1--,   --###TODO:### noch nicht zu Ende gedacht ### 
--NVL(TO_CHAR(hire_date,'$99999999D99'),0) d2
FROM employees
WHERE TO_CHAR(hire_date,'hh24') < 12;

Select to_char(hire_date,'Day') from employees natural join jobs ;


 
SELECT promo_name,cust_name
FROM promotions p 
JOIN sales s
  ON(time_id BETWEEN promo_begin_date AND promo_end_date) 
JOIN customer c
  ON (s.cust_id = c.cust_id) AND time_id < '30-oct-2007'; 
  
  
SELECT CONCAT(SUBSTR(INITCAP(last_name),1,3), REPLACE(hire_date,'-')) "USERID" FROM employees;


select department_id, job_id, count(*), sum(salary)
    from employees where department_id is not null
    group by rollup(department_id, job_id)
    order by 1,2;
    

select department_id, job_id, count(*), sum(salary)
    from employees where department_id is not null
    group by cube(department_id, job_id)
    order by 1,2;
    
select department_id, job_id, count(*), sum(salary)
    from employees where department_id is not null
    group by grouping sets((department_id, job_id), manager_id)
    ;
