SELECT '1' || 1, '1' + 1 FROM dual;

-- fm -> Fill Mode
-- fx -> Format Exact
-- sp -> Spoken
-- th -> 1st, 2nd, 3rd, 4th, ...

SELECT TO_CHAR(SYSDATE, 'DD. MONTH YYYY') FROM dual;
SELECT TO_CHAR(SYSDATE, 'Day, DD. Month YYYY') FROM dual;

SELECT last_name, TO_CHAR(hire_date, 'Day, DD. Month YYYY') FROM employees;
SELECT last_name, TO_CHAR(hire_date, 'fmDay, DD. Month YYYY') FROM employees;
SELECT last_name, TO_CHAR(hire_date, 'fmDay,fm DD. fmMonth YYYY') FROM employees;

SELECT last_name, TRIM(TO_CHAR(hire_date, 'Day'))|| 
                  TO_CHAR(hire_date, ', DD. ')||
                  TRIM(TO_CHAR(hire_date, 'Month'))||
                  TO_CHAR(hire_date, ' YYYY')
FROM employees;

SELECT * FROM v$nls_valid_values;
ALTER SESSION SET nls_date_language='ENGLISH';

SELECT last_name, TO_CHAR(hire_date, 'Day, Ddth "of" Month YYYY') FROM employees;
SELECT last_name, TO_CHAR(hire_date, 'fmDay, Ddspth "of" Month Year') FROM employees;

SELECT TO_CHAR(SYSDATE,'HH24:MI:SS') FROM dual;
SELECT TO_CHAR(SYSDATE, 'D DD DDD W WW Q Y YY YYY YYYY') FROM dual;

SELECT last_name, salary*12, TO_CHAR(salary*12, '999,999.99$') FROM employees;
SELECT last_name, salary*12, TO_CHAR(salary*12, '999g999d99L') FROM employees;
SELECT last_name, salary*12, TO_CHAR(salary*12, '099g999g999d99L') FROM employees;
SELECT last_name, salary*12, TO_CHAR(salary*12, '000g000g000d00L') FROM employees;

SELECT TO_NUMBER('12500€', '99999L') + 500 FROM dual;
SELECT TO_DATE('02 of November 2018', 'DD "of" Month YYYY') + 1 FROM dual;
SELECT TO_DATE('02 of November   2018', 'fxDD "of" Month   YYYY') + 1 FROM dual;

--NVL (expr1, expr2)
--IF expr1 IS NOT NULL THEN
--    RETURN expr1;
--ELSE
--    RETURN expr2;
--END IF;

SELECT last_name, salary, commission_pct, (salary + salary*NVL(commission_pct,0))*12 
FROM   employees;

--NVL2 (expr1, expr2, expr3)
--IF expr1 IS NOT NULL THEN
--    RETURN expr2;
--ELSE
--    RETURN expr3;
--END IF;

SELECT last_name, salary, commission_pct, (salary + salary*NVL2(commission_pct,commission_pct,0))*12 
FROM   employees;

SELECT last_name, salary, commission_pct, NVL2(commission_pct,'SAL+COMM','SAL')
FROM   employees;