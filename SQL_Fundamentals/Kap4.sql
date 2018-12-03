SELECT last_name, LENGTH(last_name), LOWER(last_name), UPPER(last_name), job_id, INITCAP(job_id)
FROM   employees;

SELECT * FROM employees WHERE LOWER(last_name) = 'abel';
SELECT * FROM employees WHERE UPPER(last_name) = 'ABEL';
SELECT * FROM employees WHERE LOWER(last_name) = LOWER('&name');

SELECT first_name || ' ' || last_name, CONCAT(CONCAT(first_name, ' '), last_name)
FROM   employees;

SELECT last_name, SUBSTR(last_name, 3), SUBSTR(last_name, 3, 3), SUBSTR(last_name, -3, 3), SUBSTR(last_name, -5, 3)
FROM   employees;

SELECT 2+7*5 FROM dual;

SELECT INSTR('abcabcabcabcabcabcabcabcabcabc', 'bc') FROM dual;  -- 2
SELECT INSTR('abcabcabcabcabcabcabcabcabcabc', 'bc', 3) FROM dual;  -- 5
SELECT INSTR('abcabcabcabcabcabcabcabcabcabc', 'bc', 3, 3) FROM dual;  -- 11
SELECT INSTR('abcabcabcabcabcabcabcabcabcabc', 'bc', -3, 3) FROM dual;  -- 20

SELECT RPAD(last_name, 5, '.') FROM employees;
SELECT CONCAT(RPAD(last_name, 20, '.'), LPAD(salary, 20, '.')) FROM employees;
SELECT CONCAT(RPAD(last_name, 20, '.-'), LPAD(salary, 20, '-.')) FROM employees;
SELECT LPAD('-',20,'-') FROM dual;

SELECT TRIM('*' FROM '***123**456******') FROM dual; -- 123**456
SELECT TRIM(BOTH '*' FROM '***123**456******') FROM dual; -- 123**456
SELECT TRIM(LEADING '*' FROM '***123**456******') FROM dual; -- 123**456******
SELECT TRIM(TRAILING '*' FROM '***123**456******') FROM dual; -- ***123**456

SELECT '('||TRIM('   123  456      ')||')' FROM dual;

SELECT LTRIM('***123**456******', '*') FROM dual; -- 123**456******
SELECT RTRIM('***123**456******', '*') FROM dual; -- ***123**456

SELECT RTRIM('***123**456****', '***') FROM dual; -- ***123**456
SELECT TRIM(BOTH '**' FROM '***123**456******') FROM dual; -- Error
-- ORA-30001: Trim-Gruppe darf nur ein Zeichen enthalten

SELECT last_name, phone_number, REPLACE(phone_number, '.', '-'), REPLACE(phone_number, '.', '---')
FROM   employees;

SELECT last_name, phone_number, REPLACE(phone_number, '123', '*'), REPLACE(phone_number, '.', '')
FROM   employees;

SELECT ROUND(155.155, 2), ROUND(155.155, 1), ROUND(155.155, 0) FROM dual;
SELECT TRUNC(155.155, 2), TRUNC(155.155, 1), TRUNC(155.155, 0) FROM dual;

SELECT ROUND(155.155, -1), ROUND(155.155, -2), ROUND(155.155, -3) FROM dual;
SELECT TRUNC(155.155, -1), TRUNC(155.155, -2), TRUNC(155.155, -3) FROM dual;

SELECT CEIL(2.1), FLOOR(2.9) FROM dual;
/* 
 CEIL(2.1) FLOOR(2.9)
---------- ----------
         3          2
*/

SELECT MOD(1350, 200), MOD(200, 1350), MOD(200, 200), MOD(7, 2), MOD(8, 2) FROM dual;
/*
MOD(1350,200) MOD(200,1350) MOD(200,200)   MOD(7,2)   MOD(8,2)
------------- ------------- ------------ ---------- ----------
          150           200            0          1          0
*/

select replace(replace(replace(mod(&&Zahl,&&Teiler),'0','ohne Rest teilbar')
                ,1,'Rest = 1')
            ,'*','Rest = ' + mod(Zahl, Teiler))  from Dual;
Undef Zahl Teiler;

SELECT SYSDATE, CURRENT_DATE FROM dual;
SELECT SYSTIMESTAMP, CURRENT_TIMESTAMP FROM dual;

-- Datum +/- Zahl -> Datum
-- Datum - Datum -> Zahl
-- Datum +/- Zahl/24 -> Datum

SELECT SYSDATE, SYSDATE + 2, SYSDATE - 2/24, SYSDATE + 20/1440 FROM dual;
-- SELECT SYSDATE, SYSDATE - 3, SYSDATE - INTERVAL '3' DAY FROM dual;

SELECT last_name, hire_date, SYSDATE-hire_date FROM employees;

SELECT last_name, hire_date, MONTHS_BETWEEN(SYSDATE, hire_date) FROM employees;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3), ADD_MONTHS(SYSDATE, -2) FROM dual;

SELECT SYSDATE, NEXT_DAY(SYSDATE, 1), NEXT_DAY(SYSDATE, 'MONDAY'), LAST_DAY(SYSDATE) FROM dual;

SELECT SYSDATE, ROUND(SYSDATE,'MONTH'), ROUND(SYSDATE, 'YEAR') FROM dual;
SELECT SYSDATE, TRUNC(SYSDATE,'MONTH'), TRUNC(SYSDATE, 'YEAR') FROM dual;