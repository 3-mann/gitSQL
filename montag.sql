HR on orcl> 
HR on orcl> r
  1  SELECT last_name, LENGTH(last_name), first_name, LENGTH(first_name),
  2  NULLIF ( LENGTH(last_name),LENGTH(first_name))
  3  FROM employees
  4* WHERE department_id=20 

LAST_NAME                 LENGTH(LAST_NAME) FIRST_NAME           LENGTH(FIRST_NAME)                                     
------------------------- ----------------- -------------------- ------------------                                     
NULLIF(LENGTH(LAST_NAME),LENGTH(FIRST_NAME))                                                                            
--------------------------------------------                                                                            
Hartstein                                 9 Michael                               7                                     
                                           9                                                                            
                                                                                                                        
Fay                                       3 Pat                                   3                                     
                                                                                                                        
                                                                                                                        

Abgelaufen: 00:00:00.08
HR on orcl> SELECT last_name, commission_pct, manager_id,
  2  COALESCE(commission_pct, manager_id, 999) FROM employees
  3  WHERE department_id=90 AND commission_pct IS NOT NULL ;

Es wurden keine Zeilen ausgewählt

Abgelaufen: 00:00:00.04
HR on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT last_name, commission_pct, manager_id,
  2  COALESCE(commission_pct, manager_id, 999) FROM employees
  3* WHERE department_id=90 OR commission_pct IS NOT NULL 
HR on orcl> /

LAST_NAME                 COMMISSION_PCT MANAGER_ID COALESCE(COMMISSION_PCT,MANAGER_ID,999)                             
------------------------- -------------- ---------- ---------------------------------------                             
King                                                                                    999                             
Kochhar                                         100                                     100                             
De Haan                                         100                                     100                             
Russell                               ,4        100                                      ,4                             
Partners                              ,3        100                                      ,3                             
Errazuriz                             ,3        100                                      ,3                             
Cambrault                             ,3        100                                      ,3                             
Zlotkey                               ,2        100                                      ,2                             
Tucker                                ,3        145                                      ,3                             
Bernstein                            ,25        145                                     ,25                             
Hall                                 ,25        145                                     ,25                             
Olsen                                 ,2        145                                      ,2                             
Cambrault                             ,2        145                                      ,2                             
Tuvault                              ,15        145                                     ,15                             
King                                 ,35        146                                     ,35                             
Sully                                ,35        146                                     ,35                             
McEwen                               ,35        146                                     ,35                             
Smith                                 ,3        146                                      ,3                             
Doran                                 ,3        146                                      ,3                             
Sewall                               ,25        146                                     ,25                             
Vishney                              ,25        147                                     ,25                             
Greene                               ,15        147                                     ,15                             
Marvins                               ,1        147                                      ,1                             
Lee                                   ,1        147                                      ,1                             
Ande                                  ,1        147                                      ,1                             
Banda                                 ,1        147                                      ,1                             
Ozer                                 ,25        148                                     ,25                             
Bloom                                 ,2        148                                      ,2                             
Fox                                   ,2        148                                      ,2                             
Smith                                ,15        148                                     ,15                             
Bates                                ,15        148                                     ,15                             
Kumar                                 ,1        148                                      ,1                             
Abel                                  ,3        149                                      ,3                             
Hutton                               ,25        149                                     ,25                             
Taylor                                ,2        149                                      ,2                             
Livingston                            ,2        149                                      ,2                             
Grant                                ,15        149                                     ,15                             
Johnson                               ,1        149                                      ,1                             

38 Zeilen ausgewählt.

Abgelaufen: 00:00:00.20
HR on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT last_name, salary, commission_pct, 
  2  COALESCE (12*(salary+ salary*commission_pct),12* salary) jahresgehalt
  3  FROM employees
  4* WHERE department_id=90 OR commission_pct IS NOT NULL 



SELECT last_name, salary, commission_pct, 
COALESCE (12*(salary+ salary*commission_pct),'alles da',12* salary) jahresgehalt
FROM employees
WHERE department_id=90 OR commission_pct IS NOT NULL 

--COALESCE (12*(salary+ salary*commission_pct),'alles da',12* salary) jahresgehalt
                                             *
SELECT last_name, COALESCE(manager_id, department_id, commission_pct)
  2  FROM employees
  3  WHERE commission_pct IS NOT NULL OR department_id =90 OR department_id IS NULL ;

SELECT last_name, COALESCE( department_id, commission_pct,manager_id)
FROM employees
WHERE commission_pct IS NOT NULL OR department_id =90 OR department_id IS NULL 



SELECT last_name, job_id FROM employees
wHERE department_id IN (10,20) ;



SELECT last_name, job_id ,salary FROM employees
wHERE department_id IN (10,20) 



SELECT last_name, job_id ,salary ,
CASE job_id WHEN 'AD_ASST' THEN salary+600
            WHEN 'MK_REP'  THEN salary*1.1
            ELSE  salary
END neues_gehalt 
FROM employees
wHERE department_id IN (10,20) 


SELECT last_name, job_id ,salary ,
CASE job_id WHEN 'AD_ASST' THEN salary+600
            WHEN 'MK_REP'  THEN salary*1.1
            ELSE  salary
END neues_gehalt 
FROM employees
wHERE department_id IN (10,20) 



SELECT last_name, job_id ,salary ,
DECODE  ( job_id , 'AD_ASST' , salary+600
            , 'MK_REP'  , salary*1.1
            ,  salary
        ) neues_gehalt 
FROM employees
wHERE department_id IN (10,20) 





SELECT last_name, job_id ,salary ,
DECODE( job_id , 'AD_ASST' , salary+600 ,  salary*1.1,  salary) neues_gehalt 
FROM employees
wHERE department_id IN (10,20) 



SELECT last_name, job_id ,salary ,
DECODE( job_id , 'AD_ASST' , salary+600 , 'MK_REP', salary*1.1 ) neues_gehalt 
FROM employees
wHERE department_id IN (10,20) 



SELECT last_name, salary, commission_pct
FROM employees
WHERE department_id IN (80,20) ;




SELECT last_name, salary, commission_pct,
CASE commission_pct     WHEN commission_pct THEN (commission_pct*salary + salary)*12 
			ELSE salary*12
END rechnung
FROM employees
WHERE department_id IN (80,20) 




SELECT last_name, job_id ,salary ,
CASE job_id WHEN 'AD_ASST' THEN salary+600
            WHEN 'MK_REP'  THEN salary*1.1
            ELSE  salary
END neues_gehalt 
FROM employees
wHERE department_id IN (10,20) 




SELECT last_name, job_id ,salary ,
CASE  WHEN job_id = 'AD_ASST' THEN salary+600
      WHEN job_id = 'MK_REP'  THEN salary*1.1
            ELSE  salary
END neues_gehalt 
FROM employees
wHERE department_id IN (10,20) 



  1  SELECT last_name, job_id ,salary ,
  2  CASE  WHEN job_id = 'AD_ASST' THEN salary+600
  3        WHEN last_name='Fay'   THEN salary*1.1
  4              ELSE  salary
  5  END neues_gehalt 
  6  FROM employees
  7* wHERE department_id IN (10,20) 



  1  SELECT last_name, job_id ,salary ,
  2  CASE  WHEN job_id = 'AD_ASST' THEN salary+600
  3        WHEN last_name='Whalen'   THEN salary*1.1
  4              ELSE  salary
  5  END neues_gehalt 
  6  FROM employees
  7* wHERE department_id IN (10,20) 



  1  SELECT last_name, job_id ,salary ,
  2  CASE  WHEN last_name='Whalen'   THEN salary*1.1
  3  	WHEN job_id = 'AD_ASST' THEN salary+600
  4              ELSE  salary
  5  END neues_gehalt 
  6  FROM employees
  7* wHERE department_id IN (10,20) 
  8  ;



SELECT last_name, salary,
  2  DECODE (TRUNC(salary/2000, 0),
  3  0, 0.00,
  4  1, 0.09,
  5  2, 0.20,
  6  3, 0.30,
  7  4, 0.40,
  8  5, 0.42,
  9  6, 0.44,
 10  0.45) TAX_RATE
 11  FROM employees
 12  WHERE department_id = 80;




SELECT * FROM departments ;
--DELETE FROM departments wHERE department_id=30 ;
--DELETE FROM departments wHERE department_id=30 


SELECT * FROM departments ;


SELECT department_name, manager_id ,
  2  CASE manager_id WHEN 100 THEN department_name
  3                  WHEN 200 THEN department_name
  4                  ELSE 'interessiert gerade nicht'
  5  END  bericht
  6  FROM departments ;



SELECT department_name, manager_id , department_name bericht
  2  wHERE manager_id IN (100,200) ;
wHERE manager_id IN (100,200) 



  1  SELECT department_name, manager_id , department_name bericht
  2  FROM departments 
  3* wHERE manager_id IN (100,200) 




  1  SELECT department_name, manager_id , 
  2  CASE manager_id WHEN 10 THEN department_name 
  3                  WHEN 20 THEN department_name
  4  		ELSE 'interessiert gerade nicht' 
  5  END  bericht
  6  FROM departments 
  7* --wHERE manager_id IN (100,200) 



  1  SELECT department_name, manager_id , 
  2  CASE manager_id WHEN 100 THEN department_name 
  3                  WHEN 200 THEN department_name
  4  		ELSE 'interessiert gerade nicht' 
  5  END  bericht
  6  FROM departments 
  7* --wHERE manager_id IN (100,200) 



  1  SELECT department_name, manager_id , 
  2  DECODE (manager_id ,100 , department_name 
  3                  , 200 , department_name
  4  		, 'interessiert gerade nicht' 
  5  ) bericht
  6  FROM departments 
  7* --wHERE manager_id IN (100,200) 




HR on orcl> SELECT to_number('10'+'ten') FROM dual ;


SELECT to_number('10'+'ten') FROM dual 
                      *
HR on orcl> SELECT last_name, salary/7 , ROUND(salary/7) FROM employees
  2  WHERE department_id=20 ;



SELECT SUM(salary), AVG(salary), MIN(salary), MAX(salary) FROM employees ;


SELECT SUM(salary), AVG(salary), MIN(salary), MAX(salary) FROM employees


SELECT SUM(salary), AVG(salary), MIN(salary), MAX(salary) FROM employees



  1  SELECT SUM(salary), AVG(salary), MIN(salary), MAX(salary), COUNT(salary) FROM employees
  2* WHERE department_id=20 



  1  SELECT last_name, SUM(salary), AVG(salary), MIN(salary), MAX(salary), COUNT(salary) FROM employees
  2* WHERE department_id=20 



  1  SELECT depertment_id, SUM(salary), AVG(salary), MIN(salary), MAX(salary), COUNT(salary) FROM employees
  2* GROUP BY department_id 



  1  SELECT department_id, SUM(salary), AVG(salary), MIN(salary), MAX(salary), COUNT(salary) FROM employees
  2* GROUP BY department_id 




  1  SELECT department_id , SUM(salary), AVG(salary), MIN(salary), MAX(salary), COUNT(salary) FROM employees
  2  GROUP BY department_id 
  3* ORDER BY 1 



 SELECT COUNT(commission_pct ) ,department_id FROM employees
  2  GROUP BY department_id ;



  1  SELECT COUNT(commission_pct ) ,SUM(commission_pct), department_id FROM employees
  2* GROUP BY department_id 



SELECT AVG(commission_pct) FROM employees ;



SELECT SUM(commission_pct)/COUNT(employee_id) FROM employees ;



SELECT SUM(commission_pct)/COUNT(commission_pct) FROM employees ;



SELECT SUM(commission_pct)/COUNT(employee_id) fuer_alle, SUM(commission_pct)/COUNT(commission_pct)
  2  fur_comm FROM employees ;




SELECT SUM(commission_pct)/COUNT(employee_id) fuer_alle,COUNT(employee_id) alle_emps, SUM(commission_pct)/COUNT(commission_pct), COUNT(commission_pct) alle_comm
  2* fur_comm FROM employees 



SELECT SUM(commission_pct)/COUNT(employee_id) fuer_alle,
  2  COUNT(employee_id) alle_emps, 
  3  SUM(commission_pct)/COUNT(commission_pct) fur_comm, 
  4  COUNT(commission_pct) alle_comm
  5*  FROM employees 



SELECT SUM(commission_pct)/COUNT(employee_id) fuer_alle,
  2  COUNT(employee_id) alle_emps, 
  3  SUM(commission_pct)/COUNT(commission_pct) fur_comm, 
  4  COUNT(commission_pct) alle_comm,
  5  AVG(commission_pct) 
  6*  FROM employees 



SELECT MIN(hire_date), MAX(hire_Date) FROM employees ;




SELECT MIN(hire_date), MAX(hire_Date), AVG(hire_date)  FROM employees ;



SELECT MIN(hire_date), MAX(hire_Date), AVG(hire_date)  FROM employees 
                                           *



SELECT MIN(last_name), MAX(last_name) FROM employees ;



SELECT MIN(last_name), MAX(last_name), AVG(last_name)  FROM employees ;



SELECT timestamp_to_scn(systimestamp) FROM dual ;



SELECT systimestamp FROM dual ;



SELECT timestamp_to_Scn(hire_date) , hire_date, last_name
  2  FROM employees
  3  WHERE department_id IN (10,20) ;

SELECT timestamp_to_Scn(hire_date) , hire_date, last_name



SELECT timestamp_to_scn(sysdate-1) , timestamp_to_scn(sysdate+1) FROM dual ;



SELECT timestamp_to_scn(sysdate-1) , timestamp_to_scn(sysdate+1) FROM dual 



SELECT timestamp_to_scn(systimestamp-1) , timestamp_to_scn(systimestamp+1) FROM dual ;



SELECT timestamp_to_scn(systimestamp-1) , timestamp_to_scn(systimestamp+1) FROM dual 
                                          *

SELECT timestamp_to_scn(systimestamp-3) , timestamp_to_scn(systimestamp-1) FROM dual ;




SELECT scn_to_timstamp(3391139) FROM dual ;



SELECT scn_to_timstamp(3391139) FROM dual 



SELECT systimestamp+2 FROM dual ;



SELECT systimestamp-3 FROM dual ;



SELECT systimestamp-1 FROM dual ;




SELECT TRUNC(systimestamp), systimestamp FROM dual ;


SELECT timestamp_to_scn(TRUNC(systimestamp-3)) ,timestamp_to_scn(TRUNC(systimestamp-1)) FROM dual ;



SELECT current_scn FROM v$database ;



SELECT COUNT(*), COUNT(commission_pct) FROM employees ;



SELECT COUNT(*), COUNT(commission_pct) FROM employees
  2  WHERE commission_pct IS NULL ;




SELECT COUNT(employee_id), COUNT(commission_pct) FROM employees
  2  WHERE commission_pct IS NOT NULL ;


SELECT DISTINCT department_id FROM employees ;




SELECT COUNT(DISTINCT(department_id)) FROM employees ;



SELECT DISTINCT(COUNT(department_id) ) FROM employees ;



SELECT COUNT(department_id) FROM employees ;



SELECT COUNT(DSTINCT(job_id)) FROM employees ;



SELECT COUNT(DISTINCT(job_id)) FROM employees ;



SELECT COUNT(DISTINCT(manager_id)) FROM employees ;



SELECT COUNT(DISTINCT(department_id)) FROM employees ;



SELECT COUNT(DISTINCT(NVL(department_id,0))) FROM employees ;



SELECT COUNT(DISTINCT(NVL(department_id,0))) FROM employees
  2  GROUP BY job_id ;



SELECT COUNT(DISTINCT(NVL(department_id,0))), job_id FROM employees
  2* GROUP BY job_id 



SELECT department_id, AVG(salary), MIN(salaray), MAXŽ(salary) FROM employees
  2  GROUP BY department_id ;


SELECT department_id, AVG(salary), MIN(salaray), MAXŽ(salary) FROM employees



SELECT department_id, AVG(salary), MIN(salaray), MAX(salary) FROM employees
  2* GROUP BY department_id 



SELECT department_id, AVG(salary), MIN(salaray), MAX(salary) FROM employees
                                       *



SELECT department_id, AVG(salary), MIN(salary), MAX(salary) FROM employees
  2* GROUP BY department_id 



SELECT department_id, AVG(salary), MIN(salary), MAX(salary) FROM employees
  2  GROUP BY department_id 
  3* ORDER BY 1 



SELECT department_id, AVG(salary), MIN(salary), MAX(salary) 
  2  FROM employees
  3  WHERE department_id IN (10,20,90) 
  4  GROUP BY department_id 
  5* ORDER BY 1 



SELECT department_id,job_id, AVG(salary), MIN(salary), MAX(salary) 
  2  FROM employees
  3  WHERE department_id IN (10,20,90) 
  4  GROUP BY department_id, job_id 
  5* ORDER BY 1 



SELECT department_id,job_id, AVG(salary), MIN(salary), MAX(salary) , COUNT(salary), SUM(salary)
  2  FROM employees
  3  WHERE department_id IN (10,20,90) 
  4  GROUP BY department_id, job_id 
  5* ORDER BY 1 



SELECT department_id,job_id, AVG(salary), MIN(salary), MAX(salary) , COUNT(salary), SUM(salary)
  2  FROM employees
  3  WHERE department_id IN (10,20,90) 
  4  GROUP BY  job_id, department_id
  5* ORDER BY 1 



SELECT * FROM employees
  2   WHERE department_id IN (10,20,90) ;



SELECT manager_id, COUNT(employee_id) FROM employees
  2  GROUP BY manager_id ;




SELECT manager_id, department_id COUNT(employee_id) FROM employees
  2* GROUP BY manager_id, department_id ;



SELECT manager_id, department_id COUNT(employee_id) FROM employees
                                      ;


SELECT manager_id, department_id    , COUNT(employee_id) FROM employees
  2* GROUP BY manager_id, department_id; 



SELECT manager_id, department_id    , COUNT(employee_id) FROM employees
  2  GROUP BY manager_id, department_id 
  3* ORDER BY 1,2 ;



SELECT manager_id, department_id    , COUNT(employee_id) FROM employees
  2  GROUP BY  department_id ,manager_id 
  3* ORDER BY 1,2 ;



SELECT manager_id, department_id ,job_id   , COUNT(employee_id) FROM employees
   GROUP BY  department_id ,manager_id ,job_id
   ORDER BY 1,2 ;



SELECT manager_id, department_id ,job_id   , COUNT(employee_id) 
  2  FROM employees
  3  GROUP BY  department_id ,manager_id ,job_id
  4* ORDER BY 1,2; 



SELECT manager_id, department_id ,job_id   , COUNT(employee_id) 
  2  FROM employees
  3  GROUP BY  job_id, department_id ,manager_id 
  4* ORDER BY 1,2 ;



  1  SELECT manager_id, department_id ,job_id   , COUNT(employee_id) 
  2  FROM employees
  3  GROUP BY  job_id, department_id ,manager_id 
  4  HAVING COUNT(employee_id) >1 
  5* ORDER BY 1,2 ;



  SELECT manager_id, department_id ,job_id   , COUNT(employee_id) 
  FROM employees
  GROUP BY  job_id, department_id ,manager_id 
  HAVING COUNT(employee_id) >1 
  ORDER BY 1,2 ;



  1  SELECT manager_id, department_id ,job_id   , COUNT(employee_id) 
  2  FROM employees
  3  WHERE department_id IN (50,80,90) 
  4  GROUP BY  job_id, department_id ,manager_id 
  5  HAVING COUNT(employee_id) >1 
  6* ORDER BY 1,2 



  1  SELECT manager_id, department_id ,job_id   , COUNT(employee_id) 
  2  FROM employees
  3  WHERE department_id IN (50,80,90) 
  4  HAVING COUNT(employee_id) >1 
  5  GROUP BY  job_id, department_id ,manager_id 
  6* ORDER BY 1,2 
  7  /




  1  SELECT manager_id, department_id ,job_id   , COUNT(employee_id) 
  2  FROM employees
  3  WHERE department_id IN (50,80,90) 
  4  GROUP BY  job_id, department_id ,manager_id 
  5  HAVING COUNT(employee_id) >1 
  6* ORDER BY 1,2 



  1  SELECT manager_id, department_id ,job_id   , COUNT(employee_id) 
  2  FROM employees
  3  HAVING COUNT(employee_id) >1 
  4  WHERE department_id IN (50,80,90) 
  5  GROUP BY  job_id, department_id ,manager_id 
  6* ORDER BY 1,2 
  7  /



  1  SELECT manager_id, department_id ,job_id   , COUNT(employee_id) 
  2  FROM employees
  3  WHERE department_id IN (50,80,90) 
  4  GROUP BY  job_id, department_id ,manager_id 
  5  HAVING COUNT(employee_id) >1 
  6* ORDER BY 1,2 
  7  /



  1  SELECT manager_id, department_id ,job_id   , COUNT(employee_id) 
  2  FROM employees
  3  WHERE department_id IN (50,80,90) 
  4  GROUP BY  job_id, department_id ,manager_id 
  5  HAVING COUNT(employee_id) >1 
  6* ORDER BY 1,2 ,4



  1  SELECT job_id   , COUNT(employee_id) 
  2  FROM employees
  3  WHERE department_id IN (50,80,90) 
  4  GROUP BY  job_id
  5* ORDER BY 1
  6  /



  1  SELECT  MAX(COUNT(employee_id)) 
  2  FROM employees
  3  WHERE department_id IN (50,80,90) 
  4  GROUP BY  job_id
  5* ORDER BY 1



SELECT AVG(salary) , department_id
  2  FROM employees
  3  GROUP BY department_id ;




  1  SELECT ROUND(AVG(salary)) , department_id
  2  FROM employees
  3* GROUP BY department_id 



  1  SELECT MAX(ROUND(AVG(salary))) 
  2  FROM employees
  3* GROUP BY department_id 



  1  SELECT MAX(ROUND(AVG(salary)))
  2  FROM employees
  3* GROUP BY department_id 


SELECT MAX(ROUND(AVG(salary)))
  2  FROM employees ;


SELECT MAX(ROUND(AVG(salary)))



  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY  job_id
  5   ORDER BY 1
  6  ;



  1   SELECT  COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY  job_id
  5*  ORDER BY 1
  6  /



  1   SELECT  job_id, COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY  job_id
  5*  ORDER BY 1



  1   SELECT  job_id,department_id  COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY  job_id, department_id 
  5*  ORDER BY 1



  1   SELECT  job_id,department_id , COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY  job_id, department_id 
  5*  ORDER BY 1



  1   SELECT  job_id,department_id , COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY ROLLUP ( job_id, department_id )
  5*  ORDER BY 1



  1   SELECT  job_id,department_id , COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY ROLLUP ( job_id, department_id )
  5*  ORDER BY 1,2 



    SELECT  job_id,department_id , COUNT(employee_id)
    FROM employees
    WHERE department_id IN (50,80,90)
    GROUP BY ROLLUP (  department_id,job_id )
    ORDER BY 1,2;

    SELECT  job_id,department_id , COUNT(employee_id)
    FROM employees
    WHERE department_id IN (50,80,90)
    GROUP BY CUBE (  department_id,job_id )
    ORDER BY 1,2;



  1   SELECT  job_id,department_id , COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY CUBE (  department_id,job_id ,manager_id  )
  5*  ORDER BY 1,2 



  1   SELECT  job_id,department_id , COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY ROLLUP (  department_id,job_id ,manager_id  )
  5*  ORDER BY 1,2 



     SELECT  job_id,department_id ,manager_id,  COUNT(employee_id)
     FROM employees
     WHERE department_id IN (50,80,90)
     GROUP BY ROLLUP (  department_id,job_id ,manager_id  )
     ORDER BY 1,2; 



     SELECT  job_id,department_id ,manager_id,  COUNT(employee_id)
     FROM employees
     WHERE department_id IN (50,80,90)
     --GROUP BY ROLLUP (  job_id ,department_id,manager_id  )
     ORDER BY 1,2,3;


     SELECT  job_id,department_id ,manager_id,  COUNT(employee_id)
     FROM employees
     WHERE department_id IN (50,80,90)
     GROUP BY CUBE (  job_id ,department_id,manager_id  )
     ORDER BY 1,2 ,3;



  1   SELECT  job_id,department_id ,manager_id,  COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY  (  job_id ,department_id,manager_id  ) GROUPING SETS (job_id, manager_id)
  5*  ORDER BY 1,2 ,3



  1   SELECT  job_id,department_id ,manager_id,  COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY  (  job_id ,department_id,manager_id  ) , GROUPING SETS (job_id, manager_id)
  5*  ORDER BY 1,2 ,3



  1   SELECT  job_id,department_id ,manager_id,  COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY  (  job_id ,department_id,manager_id  ) , GROUPING SETS ((job_id, manager_id))
  5*  ORDER BY 1,2 ,3



  1   SELECT  job_id,department_id ,manager_id,  COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY  (  job_id ,department_id,manager_id  ) --, GROUPING SETS ((job_id, manager_id))
  5*  ORDER BY 1,2 ,3



HR on orcl> ed
file afiedt.buf wurde geschrieben

  1   SELECT  job_id,department_id ,manager_id,  COUNT(employee_id)
  2   FROM employees
  3   WHERE department_id IN (50,80,90)
  4   GROUP BY  (  job_id ,department_id,manager_id  ) , 
  5    GROUPING SETS ((job_id, manager_id),(job_id))
  6*  ORDER BY 1,2 ,3




--############################################################################
HR on orcl> conn scott/tiger
Connect durchgeführt.
SCOTT on orcl> 
SCOTT on orcl> conn sys as sysdba
Connect durchgeführt.
SYS on orcl> 
SYS on orcl> DROP USER scott CASCADE ;
DROP USER scott CASCADE 
*
FEHLER in Zeile 1:
ORA-00604: Fehler auf rekursiver SQL-Ebene 1 
ORA-55622: DML-, ALTER- und CREATE UNIQUE INDEX-Vorgänge sind auf Tabelle "SCOTT"."SYS_FBA_TCRV_74999" nicht zulässig 


SYS on orcl> SELECT * FROM dba_fba_tables ;
SELECT * FROM dba_fba_tables 
              *
FEHLER in Zeile 1:
ORA-00942: Tabelle oder View nicht vorhanden 


SYS on orcl> SELECT * FROM dba_fba_archives ;
SELECT * FROM dba_fba_archives 
              *
FEHLER in Zeile 1:
ORA-00942: Tabelle oder View nicht vorhanden 


SYS on orcl> SELECT table_name FROM dict WHERE table_name LIKE '%ARCHIV%' ;

TABLE_NAME                                                                                                              
------------------------------------------------------------------------------------------------------------------------
USER_FLASHBACK_ARCHIVE                                                                                                  
USER_FLASHBACK_ARCHIVE_TABLES                                                                                           
DBA_FLASHBACK_ARCHIVE                                                                                                   
DBA_FLASHBACK_ARCHIVE_TABLES                                                                                            
DBA_FLASHBACK_ARCHIVE_TS                                                                                                
DBA_REGISTERED_ARCHIVED_LOG                                                                                             
CDB_FLASHBACK_ARCHIVE                                                                                                   
CDB_FLASHBACK_ARCHIVE_TABLES                                                                                            
CDB_FLASHBACK_ARCHIVE_TS                                                                                                
CDB_REGISTERED_ARCHIVED_LOG                                                                                             
GV$ARCHIVE                                                                                                              
GV$ARCHIVED_LOG                                                                                                         
GV$ARCHIVE_DEST                                                                                                         
GV$ARCHIVE_DEST_STATUS                                                                                                  
GV$ARCHIVE_GAP                                                                                                          
GV$ARCHIVE_PROCESSES                                                                                                    
GV$FOREIGN_ARCHIVED_LOG                                                                                                 
GV$PROXY_ARCHIVEDLOG                                                                                                    
V$ARCHIVE                                                                                                               
V$ARCHIVED_LOG                                                                                                          
V$ARCHIVE_DEST                                                                                                          
V$ARCHIVE_DEST_STATUS                                                                                                   
V$ARCHIVE_GAP                                                                                                           
V$ARCHIVE_PROCESSES                                                                                                     
V$BACKUP_ARCHIVELOG_DETAILS                                                                                             
V$BACKUP_ARCHIVELOG_SUMMARY                                                                                             
V$FOREIGN_ARCHIVED_LOG                                                                                                  
V$PROXY_ARCHIVEDLOG                                                                                                     
V$PROXY_ARCHIVELOG_DETAILS                                                                                              
V$PROXY_ARCHIVELOG_SUMMARY                                                                                              

30 Zeilen ausgewählt.

SYS on orcl> SELECT * FROM DBA_FLASHBACK_ARCHIVE ;

OWNER_NAME                                                                                                              
------------------------------------------------------------------------------------------------------------------------
FLASHBACK_ARCHIVE_NAME                                                                                                  
------------------------------------------------------------------------------------------------------------------------
FLASHBACK_ARCHIVE# RETENTION_IN_DAYS CREATE_TIME                                                                        
------------------ ----------------- ---------------------------------------------------------------------------        
LAST_PURGE_TIME                                                             STATUS                                      
--------------------------------------------------------------------------- -------                                     
SCOTT                                                                                                                   
SCOTT_FBA                                                                                                               
                 1               365 25.09.18 16:11:26,000000000                                                        
25.09.18 16:11:26,000000000                                                                                             
                                                                                                                        

SYS on orcl> DROP FLASHBACK DATA ARCHIVE scott_fba ;
DROP FLASHBACK DATA ARCHIVE scott_fba 
               *
FEHLER in Zeile 1:
ORA-00950: Ungültige DROP-Option 


SYS on orcl> DROP FLASHBACK  ARCHIVE scott_fba ;

Flashback Archive gelöscht.

SYS on orcl> DROP USER scott CASCADE ;

Benutzer wurde gelöscht.

SYS on orcl> CREATE USER scott IDENTIFIED BY tiger DEFAULT TABLESPACE users QUOTA UNLIMITED ON users ;

Benutzer wurde erstellt.

SYS on orcl> GRANT DBA TO scott ;

Benutzerzugriff (Grant) wurde erteilt.

SYS on orcl> GRANT sysdba TO scott ;

Benutzerzugriff (Grant) wurde erteilt.

SYS on orcl> GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT ;

Benutzerzugriff (Grant) wurde erteilt.

SYS on orcl> conn scott/tiger
Connect durchgeführt.
SCOTT on orcl> DROP TABLE DEPT;
DROP TABLE DEPT
           *
FEHLER in Zeile 1:
ORA-00942: Tabelle oder View nicht vorhanden 


SCOTT on orcl> CREATE TABLE DEPT
  2         (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
  3  	DNAME VARCHAR2(14) ,
  4  	LOC VARCHAR2(13) ) ;


SCOTT on orcl> DROP TABLE EMP;
DROP TABLE EMP


SCOTT on orcl> CREATE TABLE EMP
  2         (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
  3  	ENAME VARCHAR2(10),
  4  	JOB VARCHAR2(9),
  5  	MGR NUMBER(4),
  6  	HIREDATE DATE,
  7  	SAL NUMBER(7,2),
  8  	COMM NUMBER(7,2),
  9  	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);

Tabelle wurde erstellt.

SCOTT on orcl> INSERT INTO DEPT VALUES
  2  	(10,'ACCOUNTING','NEW YORK');

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO DEPT VALUES
  2  	(30,'SALES','CHICAGO');

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO DEPT VALUES
  2  	(40,'OPERATIONS','BOSTON');

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO EMP VALUES
  2  (7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

1 Zeile wurde erstellt.

SCOTT on orcl> DROP TABLE BONUS;
DROP TABLE BONUS
           *
FEHLER in Zeile 1:
ORA-00942: Tabelle oder View nicht vorhanden 


SCOTT on orcl> CREATE TABLE BONUS
  2  	(
  3  	ENAME VARCHAR2(10)	,
  4  	JOB VARCHAR2(9)  ,
  5  	SAL NUMBER,
  6  	COMM NUMBER
  7  	) ;

Tabelle wurde erstellt.

SCOTT on orcl> DROP TABLE SALGRADE;
DROP TABLE SALGRADE
           *
FEHLER in Zeile 1:
ORA-00942: Tabelle oder View nicht vorhanden 


SCOTT on orcl> CREATE TABLE SALGRADE
  2        ( GRADE NUMBER,
  3  	LOSAL NUMBER,
  4  	HISAL NUMBER );

Tabelle wurde erstellt.

SCOTT on orcl> INSERT INTO SALGRADE VALUES (1,700,1200);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO SALGRADE VALUES (2,1201,1400);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO SALGRADE VALUES (3,1401,2000);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO SALGRADE VALUES (4,2001,3000);

1 Zeile wurde erstellt.

SCOTT on orcl> INSERT INTO SALGRADE VALUES (5,3001,9999);

1 Zeile wurde erstellt.

SCOTT on orcl> COMMIT;



SCOTT on orcl> SELECT COUNT(empno), deptno, job, mgr FROM emp
  2  GROUP BY deptno, job, gr
  3  ORDER BY deptno, job, mgr
  4  .
SCOTT on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT COUNT(empno), deptno, job, mgr FROM emp
  2  GROUP BY deptno, job, mgr
  3* ORDER BY deptno, job, mgr


  1  SELECT COUNT(empno), deptno, mgr, job FROM emp
  2  GROUP BY deptno,  mgr,job
  3* ORDER BY deptno, mgr ,job
  4  /


  1  SELECT COUNT(empno), deptno, mgr, job FROM emp
  2  GROUP BY ROLLUP ( deptno,  mgr,job )
  3* ORDER BY deptno, mgr ,job


  1  SELECT COUNT(empno), deptno, mgr, job FROM emp
  2  GROUP BY CUBE ( deptno,  mgr,job )
  3* ORDER BY deptno, mgr ,job


  1  SELECT COUNT(empno), deptno, mgr, job FROM emp
  2  GROUP BY CUBE ( deptno,  mgr,job ) , GROUPING SETS (deptno,job)
  3* ORDER BY deptno, mgr ,job


SCOTT on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT COUNT(empno), deptno, mgr, job FROM emp
  2  GROUP BY CUBE ( deptno,  mgr,job ) --, GROUPING SETS (deptno,job)
  3* ORDER BY deptno, mgr ,job


  1  SELECT COUNT(empno), deptno, mgr, job FROM emp
  2  --GROUP BY CUBE ( deptno,  mgr,job ) --
  3  , GROUPING SETS (deptno,job)
  4* ORDER BY deptno, mgr ,job
SCOTT on orcl> /
, GROUPING SETS (deptno,job)
                *
FEHLER in Zeile 3:
ORA-00933: SQL-Befehl wurde nicht korrekt beendet 


SCOTT on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT COUNT(empno), deptno, mgr, job FROM emp
  2  GROUP BY ( deptno,  mgr,job ) --
  3  , GROUPING SETS (deptno,job)
  4* ORDER BY deptno, mgr ,job



  1  SELECT COUNT(empno), deptno, mgr, job FROM emp
  2  GROUP BY GROUPING SETS ( deptno,  job ) --
  3  --, GROUPING SETS (deptno,job)
  4* ORDER BY deptno, mgr ,job
SCOTT on orcl> /
SELECT COUNT(empno), deptno, mgr, job FROM emp
                             *
FEHLER in Zeile 1:
ORA-00979: Kein GROUP BY-Ausdruck 


SCOTT on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT COUNT(empno), deptno, mgr, job FROM emp
  2  GROUP BY GROUPING SETS (( deptno,  job ),(mgr)) --
  3  --, GROUPING SETS (deptno,job)
  4* ORDER BY deptno, mgr ,job


SCOTT on orcl> SELECT * FROM emp ;


SCOTT on orcl> SELECT COUNT(empno), job, deptno, mgr
  2  FROM emp
  3  GROUP BY job,deptno, mgr
  4  ORDER BY job,deptno, mgr ;


  1  SELECT COUNT(empno), job, deptno, mgr
  2  FROM emp
  3  GROUP BY ROllUP (job,deptno, mgr) 
  4* ORDER BY job,deptno, mgr 


SCOTT on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT COUNT(empno), job, deptno, mgr
  2  FROM emp
  3  GROUP BY CUBE (job,deptno, mgr) 
  4* ORDER BY job,deptno, mgr 
SCOTT on orcl> /



SCOTT on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT COUNT(empno), job, deptno, mgr
  2  FROM emp
  3  GROUP BY CUBE (job,deptno, mgr) , GROUPING SETS (job,mgr) 
  4* ORDER BY job,deptno, mgr 
SCOTT on orcl> /


  1  SELECT COUNT(empno), job, deptno, mgr
  2  FROM emp
  3  GROUP BY  GROUPING SETS ((job,mgr),(deptno)) 
  4* ORDER BY job,deptno, mgr 
SCOTT on orcl> /

SCOTT on orcl> SELECT COUNT(empno), job, deptno, mgr
  2  FROM emp
  3  GROUP BY CUBE (job,deptno, mgr) , GROUPING SETS (job,mgr)
  4  ORDER BY job,deptno, mgr
  5  .
SCOTT on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT COUNT(empno), DISICT(job, deptno, mgr)
  2  FROM emp
  3  GROUP BY CUBE (job,deptno, mgr) , GROUPING SETS (job,mgr)
  4* ORDER BY job,deptno, mgr
SCOTT on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT COUNT(empno), DISINCT(job, deptno, mgr)
  2  FROM emp
  3  GROUP BY CUBE (job,deptno, mgr) , GROUPING SETS (job,mgr)
  4* ORDER BY job,deptno, mgr
SCOTT on orcl> /
SELECT COUNT(empno), DISINCT(job, deptno, mgr)
                     *
FEHLER in Zeile 1:
ORA-00904: "DISINCT": ungültige ID 


SCOTT on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT COUNT(empno), DISTINCT (job, deptno, mgr)
  2  FROM emp
  3  GROUP BY CUBE (job,deptno, mgr) , GROUPING SETS (job,mgr)
  4* ORDER BY job,deptno, mgr
SCOTT on orcl> /
SELECT COUNT(empno), DISTINCT (job, deptno, mgr)
                     *
FEHLER in Zeile 1:
ORA-00936: Ausdruck fehlt 


SCOTT on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT COUNT(empno), DISTINCT job, deptno, mgr
  2  FROM emp
  3  GROUP BY CUBE (job,deptno, mgr) , GROUPING SETS (job,mgr)
  4* ORDER BY job,deptno, mgr
SCOTT on orcl> /
SELECT COUNT(empno), DISTINCT job, deptno, mgr
                     *
FEHLER in Zeile 1:
ORA-00936: Ausdruck fehlt 


SCOTT on orcl> ed
file afiedt.buf wurde geschrieben

  1  SELECT DISTINCT COUNT(empno),  job, deptno, mgr
  2  FROM emp
  3  GROUP BY CUBE (job,deptno, mgr) , GROUPING SETS (job,mgr)
  4* ORDER BY job,deptno, mgr
SCOTT on orcl> /


    SELECT DISTINCT COUNT(empno),  job, deptno, mgr
    FROM emp
    GROUP BY ROLLUP (job,deptno, mgr) , GROUPING SETS (job,mgr)
    ORDER BY job,deptno, mgr;

select * from emp_details_view;
SELECT
    employee_id,
    job_id,
    manager_id,
    department_id,
    location_id,
    country_id,
    first_name,
    last_name,
    salary,
    commission_pct,
    department_name,
    job_title,
    city,
    state_province,
    country_name,
    region_name
FROM
    emp_details_view;