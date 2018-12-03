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

SELECT TO_DATE(NVL(SYSDATE-END_DATE,SYSDATE))FROM job_history;

SELECT to_date(SYSDATE-END_DATE) FROM job_history; 

SELECT NVL(TO_CHAR(MONTHS_BETWEEN(start_date,end_date)),'Ongoing') FROM job_history;
--###################################################

SELECT employee_id, NVL2(NULLIF(salary, salary), 0, 1000)"BONUS" FROM employees;
SELECT employee_id, NVL2(NULLIF(salary, salary*2), 0, 1000)"BONUS" FROM employees;


--###################################################
SELECT employee_id, NVL2(hire_date-hire_date, hire_date + 15,'') FROM employees; 
SELECT employee_id, NVL(hire_date-hire_date, hire_date + 15) FROM employees;
--###################################################

SELECT TO_CHAR(hire_date,'dd/month/YYYY'), hire_date, TO_DATE('01.jan.03'), TO_DATE('31.dez.06')	
FROM employees WHERE hire_date between TO_DATE('01.jan.03') and  TO_DATE('31.dez.06');

SELECT TO_CHAR(hire_date,'dd/month/YYYY'), hire_date, TO_DATE('01.jan.03'), TO_DATE('31.dez.06')	
FROM employees WHERE hire_date >= TO_DATE('01.jan.03') and hire_date <=  TO_DATE('31.dez.06');
--####################################################
SELECT employee_id, DECODE(NULLIF(salary, 10000), NULL, salary*.25, 'N/A') "Catcost" FROM employees;
SELECT employee_id, DECODE(salary, >10000, 'High', <10000, 'Low') "Range" FROM employees;

--############ Ranking (für ORA21)##########  TODO: Verstehe ich nicht; nachfragen  ######
SELECT RANK() OVER(ORDER BY salary DESC) rank, last_name, salary 
FROM employees 
ORDER BY salary DESC
FETCH FIRST 11 ROWS WITH TIES; 

--####################################################
SELECT SUBSTR(hire_date,7) SubString
     , SUM(DECODE(SUBSTR(hire_date,8),'04',1,0)) "2004"
     , SUM(DECODE(SUBSTR(hire_date,8),'05',1,0)) "2005" 
     FROM employees
     Group by SUBSTR(hire_date,7);
     
SELECT SUM(DECODE(SUBSTR(promo_begin_date,7),'00',1,0)) "2000"
     , SUM(DECODE(SUBSTR(promo_begin_date,7),'99',1,0)) "1999" FROM promotions;

Select * from Promotions;
     
SELECT SUM(CASE TO_CHAR(promo_begin_date,'yy')      --  Vorsicht ! nicht 'YYYY'
       WHEN '99' THEN 1 ELSE 0 END) "1999"
      ,SUM(CASE TO_CHAR(promo_begin_date,'yyyy')    -- oder 4-stellig vergleichen
      WHEN '2000' THEN 1 ELSE 0 END) "2000" 
      FROM promotions;
 
SELECT sum(CASE TO_CHAR(promo_begin_date,'yyyy') 
    WHEN '1999' THEN 1 ELSE 0 END) "1999"
    , sum(CASE TO_CHAR(promo_begin_date,'yyyy') 
    WHEN '2000' THEN 1 ELSE 0 END) "2000" 
    FROM promotions;


SELECT sum(DECODE(TO_CHAR(promo_begin_date,'yyyy'), '1999', 1, 0)) "1999"
     , sum(DECODE(TO_CHAR(promo_begin_date,'yyyy'),'2000', 1, 0)) "2000" 
FROM promotions;

--###############################################

SELECT TO_CHAR(hire_date,'dd-mon-yyyy hh24:mi:ss'), TO_CHAR(salary,'$99999999D99') FROM employees  
WHERE TO_char(hire_date,'hh24') < 12  
AND COALESCE(salary,NULL) is not NULL;


SELECT TO_CHAR(hire_date,'dd-mon-yyyy hh24:mi:ss'), NVL(TO_CHAR(salary,'$99999999D99'),0) 
FROM employees 
WHERE TO_CHAR(hire_date,'hh24') < 12;

SELECT TO_CHAR(hire_date,'dd-mon-yyyy hh24:mi:ss'), COALESCE(TO_Char(salary,'$99999999.99'),0) 
FROM employees 
WHERE TO_DATE(hire_date,'hh24') < 12;

Select coalesce(TO_Char(salary,'$99999999.99'),'0') test from employees;

SELECT TO_DATE (trans_date,'dd-mon-yyyy hh24:mi:ss'), NVL2(trans_amt,TO_NUMBER(trans_amt,'$99999999.99'), 0) 
FROM transactions WHERE TO_DATE(trans_date,'hh24') < 12;
