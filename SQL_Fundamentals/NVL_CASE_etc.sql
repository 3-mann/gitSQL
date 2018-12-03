SELECT COALESCE(1, 'A') FROM dual;
-- ORA-00932: Inkonsistente Datentypen: NUMBER erwartet, CHAR erhalten
SELECT COALESCE('A', 1) FROM dual;
-- ORA-00932: Inkonsistente Datentypen: CHAR erwartet, NUMBER erhalten

SELECT last_name, commission_pct, manager_id, COALESCE(commission_pct, manager_id, -1)
FROM employees;

SELECT NVL(TO_CHAR(NULL), 'A') FROM dual; -- Ok
SELECT NVL(TO_CHAR(NULL), 10) FROM dual; -- Ok
SELECT NVL(TO_NUMBER(NULL), 10) FROM dual; -- Ok
SELECT NVL(TO_NUMBER(NULL), '10') FROM dual; -- Ok
SELECT NVL(TO_NUMBER(NULL), '$10') FROM dual; -- Error ORA-01722: Ungültige Zahl

SELECT NVL(TO_NUMBER(NULL), SYSDATE) FROM dual;
SELECT NVL2(NULL, SYSDATE-TO_DATE('01-jan-18'), SYSDATE) FROM dual;

NVL(arg1, arg2) 

IF arg1 IS NOT NULL THEN
    RETURN arg1;
ELSE
    RETURN arg2;
END IF;

NVL2(arg1, arg2, arg3) 

IF arg1 IS NOT NULL THEN
    RETURN arg2;
ELSE
    RETURN arg3;
END IF;

COALESE(arg1, arg2, arg3, ... , argX) 

IF arg1 IS NOT NULL THEN
    RETURN arg1;
ELSIF arg2 IS NOT NULL THEN
    RETURN arg2;
ELSIF arg3 IS NOT NULL THEN
    RETURN arg3;
....
....
ELSE
    RETURN NULL;
END IF;


SELECT department_id, CASE department_id WHEN 10 THEN 'Dep 10'
                                         WHEN 20 THEN 'Dep 20'
                                         WHEN 30 THEN 'Dep 30'
                                         WHEN 40 THEN 'Dep 40'
                                         WHEN 50 THEN 'Dep 50'
                                         ELSE 'Unknown' END dept
FROM employees
ORDER BY 1;      

SELECT department_id, DECODE(department_id , 10 , 'Dep 10'
                                           , 20 , 'Dep 20'
                                           , 30 , 'Dep 30'
                                           , 40 , 'Dep 40'
                                           , 50 , 'Dep 50'
                                           , 'Unknown') dept
FROM employees
ORDER BY 1;  

SELECT last_name, salary, CASE WHEN salary < 5000  THEN 'Low'
                               WHEN salary < 10000 THEN 'Medium'
                               ELSE 'High' END salary_grade
FROM employees
ORDER BY 1; 


SELECT promo_name,CASE  WHEN promo_cost >=(SELECT AVG(promo_cost)
                                           FROM promotions
                                           WHERE promo_category='TV')
                        THEN 'HIGH'
                        ELSE 'LOW'
                  END COST_REMARK
FROM promotions;

SELECT promo_name, CASE WHEN promo_cost >=(SELECT AVG(promo_cost)
                                           FROM promotions
                                           WHERE promo_category='TV')
                        THEN 'HIGH'
                        ELSE 'LOW'
                 END COST_REMARK
FROM promotions;

SELECT last_name, commission_pct, CASE commission_pct WHEN 0.1 THEN '000.100'
                                                      WHEN 0.2 THEN '000.200'
                                                      WHEN NULL THEN '***NULL***'
                                                      ELSE '000.000' END comm1,
                                  DECODE(commission_pct , 0.1 , '000.100'
                                                        , 0.2 , '000.200'
                                                        , NULL , '***NULL***'
                                                        , '000.000') comm2
FROM employees;