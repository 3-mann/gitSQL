SET SERVEROUTPUT ON
DECLARE
v_myage number:=31;
BEGIN
IF v_myage < 11
THEN
DBMS_OUTPUT.PUT_LINE(' I am a child ');
END IF;
END;
/
DECLARE
v_myage number:=31;
BEGIN
IF v_myage < 11
THEN
DBMS_OUTPUT.PUT_LINE(' I am a child ');
ELSE 
DBMS_OUTPUT.PUT_LINE(' I am not a child' ) ;
END IF;
END;
/
DECLARE
v_myage number:=21;
BEGIN
IF v_myage < 11 THEN
DBMS_OUTPUT.PUT_LINE(' I am a child ');
ELSIF v_myage < 20 THEN
DBMS_OUTPUT.PUT_LINE(' I am young ');
ELSIF v_myage < 30 THEN
DBMS_OUTPUT.PUT_LINE(' I am in my twenties');
ELSIF v_myage < 40 THEN
DBMS_OUTPUT.PUT_LINE(' I am in my thirties');
ELSE
DBMS_OUTPUT.PUT_LINE(' I am always young ');
END IF;
END;
/

DECLARE
v_myage number;
BEGIN
IF v_myage < 11 THEN
DBMS_OUTPUT.PUT_LINE(' I am a child ');
ELSIF v_myage IS NULL THEN 
DBMS_OUTPUT.PUT_LINE(' I am not a child'||v_myage||'H');
ELSE DBMS_OUTPUT.PUT_LINE('sonst') ;
END IF;
END; 
/

SET VERIFY OFF
DECLARE
v_grade CHAR(1) := UPPER('&grade');
v_appraisal VARCHAR2(20);
BEGIN
v_appraisal := CASE v_grade
WHEN 'A' THEN 'Excellent'
WHEN 'B' THEN 'Very Good'
WHEN 'C' THEN 'Good'
ELSE 'No such grade'
END;
DBMS_OUTPUT.PUT_LINE ('Grade: '|| v_grade ||' Appraisal' || v_appraisal);
END;
/

SELECT last_name, job_id, CASE job_id WHEN 'SA_REP' THEN salary*2
                                    WHEN 'SA_MAN' THEN salary *1.4
                                    ELSE salary  END gehalt_sa 
FROM employees ;

SELECT last_name, job_id ,salary, department_id, CASE WHEN salary < 3000 THEN salary+1000 
                                WHEN job_id='PU_CLERK' THEN salary *1.2 
                                WHEN department_id IN (20,30,90) THEN salary*1.1
                                ELSE salary END gehalt_neu 
FROM employees ;

DECLARE
v_grade CHAR(1) := UPPER('&grade');
v_appraisal VARCHAR2(20);
v_sum_sal NUMBER ;
BEGIN
SELECT SUM(salary) INTO v_sum_sal FROM employees ;
v_appraisal := CASE
                WHEN v_grade = 'A' THEN 'Excellent'
                WHEN v_grade IN ('B','C') THEN 'Good'
                WHEN v_grade>='E' THEN to_char(v_sum_sal)
                ELSE 'No such grade'
                END;
DBMS_OUTPUT.PUT_LINE ('Grade: '|| v_grade ||' Appraisal ' || v_appraisal);
END;
/
var b_a NUMBER ;
var b_b NUMBER ;
var b_c NUMBER ;

BEGIN 
:b_a:=1 ;
:b_b:=2 ;
:b_c:=3 ;
END ;
/
print :b_a :b_b :b_c

DECLARE
v_deptid NUMBER;
v_deptname VARCHAR2(20);
v_emps NUMBER;
v_mngid NUMBER:= &manger_id;
v_zahl NUMBER :=&zahl  ;
BEGIN
CASE 
WHEN v_mngid=108 THEN
SELECT department_id, department_name
INTO v_deptid, v_deptname FROM departments
WHERE manager_id=108;
SELECT count(*) INTO v_emps FROM employees
WHERE department_id=v_deptid;
WHEN v_mngid=200 THEN
DBMS_OUTPUT.PUT_LINE (to_char(v_mngid)) ;
WHEN v_zahl BETWEEN 100 AND 300 THEN 
DBMS_OUTPUT.PUT_LINE(to_char(v_zahl));
ELSE  DBMS_OUTPUT.PUT_LINE('fehler') ;
END CASE;
DBMS_OUTPUT.PUT_LINE ('You are working in the '|| v_deptname||
' department. There are '||v_emps ||' employees in this department');
END;
/

SELECT * FROM locations WHERE country_id='CA' ;

DECLARE
v_countryid locations.country_id%TYPE := 'CA';
v_loc_id locations.location_id%TYPE;
v_counter NUMBER(2) := 1;
v_new_city locations.city%TYPE := 'Montreal';
BEGIN
SELECT MAX(location_id) INTO v_loc_id FROM locations
WHERE country_id = v_countryid;
LOOP
INSERT INTO locations(location_id, city, country_id)
VALUES((v_loc_id + v_counter), v_new_city, v_countryid);
v_counter := v_counter + 1;
EXIT WHEN v_counter > 3;
END LOOP;
END;
/

SELECT * FROM locations ;
rollback ;
DECLARE
v_countryid locations.country_id%TYPE := 'CA';
v_loc_id locations.location_id%TYPE;
v_new_city locations.city%TYPE := 'Montreal';
v_counter NUMBER := 1;
BEGIN
SELECT MAX(location_id) INTO v_loc_id FROM locations
WHERE country_id = v_countryid;
WHILE v_counter <= 3 LOOP
DBMS_OUTPUT.PUT_LINE(v_counter||' bin drin in schleife') ;
INSERT INTO locations(location_id, city, country_id)
VALUES((v_loc_id + v_counter), v_new_city, v_countryid);
v_counter := v_counter + 1;
END LOOP;
END;
/

DECLARE
v_countryid locations.country_id%TYPE := 'CA';
v_loc_id locations.location_id%TYPE;
v_new_city locations.city%TYPE := 'Montreal';
BEGIN
SELECT MAX(location_id) INTO v_loc_id
FROM locations
WHERE country_id = v_countryid;
FOR i IN 1..3 LOOP
INSERT INTO locations(location_id, city, country_id)
VALUES((v_loc_id + i), v_new_city, v_countryid );
END LOOP;
END;
/

DECLARE
v_countryid locations.country_id%TYPE := 'CA';
v_loc_id locations.location_id%TYPE;
v_counter NUMBER := 4;
v_new_city locations.city%TYPE := 'Montreal';
BEGIN
SELECT MAX(location_id) INTO v_loc_id FROM locations ;
--WHERE country_id = v_countryid;
LOOP
DBMS_OUTPUT.PUT_LINE(v_counter||' bin drin in schleife') ;
INSERT INTO locations(location_id, city, country_id)
VALUES((v_loc_id + v_counter), v_new_city, v_countryid);
v_counter := v_counter + 1;
EXIT WHEN v_counter>3  ;
END LOOP;
END;
/
rollback ;
desc locations 
DELETE FROM locations WHERE street_address IS NULL ;
ALTER TABLE locations MODIFY location_id NUMBER ;
SELECT COUNT(*) FROM locations ;
SAVEPOINT vor_insert ;



DECLARE
v_total SIMPLE_INTEGER := 0;
BEGIN
FOR i IN 1..10 LOOP
v_total := v_total + i;
dbms_output.put_line  ('Total is: '|| v_total);
CONTINUE WHEN i > 5;
v_total := v_total + i;
dbms_output.put_line ('Out of Loop Total is:'|| v_total);
END LOOP;
END;
/
--1..10 ohne 7,9
DECLARE 
v_zahl NUMBER :=1;
BEGIN 
FOR i IN 1..10 LOOP 
CONTINUE WHEN i IN (7,9) ;
DBMS_OUTPUT.PUT_LINE(i||'wir sind in 1. Continue') ;
CONTINUE WHEN i IN (3,5) ;
DBMS_OUTPUT.PUT_LINE(i||'wir sind in 2. Continue') ;
END LOOP ;
END ;
/

DECLARE 
v_sal           employees.salary%TYPE ;
v_sal2          v_sal%TYPE ;
v_balance       NUMBER(7,2) ;
v_min_balance   v_balance%TYPE ;
v_emp           employees%ROWTYPE ;

TYPE emp_type IS RECORD 
( v_sal3        employees.salary%TYPE
, v_last_name   employees.last_name%TYPE
, v_department  departments%ROWTYPE
);

v_my_emp    emp_type;

BEGIN 
SELECT * INTO v_emp FROM employees WHERE last_name='Fay' ;
v_sal := v_emp.salary ;
DBMS_OUTPUT.PUT_LINE(v_emp.first_name||' '||v_emp.last_name||' '||v_sal) ;

v_my_emp.v_sal3 :=200 ;
SELECT last_name  INTO v_my_emp.v_last_name
FROM employees WHERE employee_id=101 ;
SELECT * INTO v_my_emp.v_department
FROM departments WHERE department_id=10 ;

DBMS_OUTPUT.PUT_LINE(v_my_emp.v_sal3||' '|| v_my_emp.v_department.department_name) ;
END ;
/
--################################################################################
--1..10 ohne 7,9
DECLARE 
v_monat varchar(20) :='';
BEGIN
DBMS_OUTPUT.PUT_LINE('Ausgabe gültiger Monate') ;
DBMS_OUTPUT.PUT_LINE('_____________________________') ;
FOR i IN 1..12 LOOP 
--CONTINUE WHEN i IN (7,9) ;
select to_char(ADD_MONTHS(sysdate,i-1),'Month') into v_monat from dual;
DBMS_OUTPUT.PUT_LINE(to_char(i,'00')||' - '|| v_monat) ;
END LOOP ;
END ;
/
--################################################################################
select to_date('01-Jan-2030') - sysdate from dual;
--################################################################################
select * from employees where salary > 10.000;

--################################################################################

SET SERVEROUTPUT ON

DECLARE
   v_today DATE:=SYSDATE;
   v_tomorrow v_today%TYPE;
BEGIN
   v_tomorrow:=v_today +1;
   DBMS_OUTPUT.PUT_LINE(' Hello World ');
   DBMS_OUTPUT.PUT_LINE('TODAY IS : '|| v_today);
   DBMS_OUTPUT.PUT_LINE('TOMORROW IS : ' || v_tomorrow);
END;
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
VARIABLE b_basic_percent NUMBER
VARIABLE b_pf_percent NUMBER
DECLARE
   v_today DATE:=SYSDATE;
   v_tomorrow v_today%TYPE;
BEGIN
   :b_basic_percent:=45;
   :b_pf_percent:=12;

   v_tomorrow:=v_today +1;
   DBMS_OUTPUT.PUT_LINE(' Hello World ');
   DBMS_OUTPUT.PUT_LINE('TODAY IS : '|| v_today);
   DBMS_OUTPUT.PUT_LINE('TOMORROW IS : ' || v_tomorrow);
END;
/
PRINT b_basic_percent;
PRINT b_pf_percent;
/

-- You can use a single PRINT command without any parameters to print all 
-- bind variables.
--################################################################################

set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
SET SERVEROUTPUT ON

DECLARE
   v_today DATE:=SYSDATE;   v_tomorrow v_today%TYPE;
   v_fname VARCHAR2(15);
   v_emp_sal NUMBER(10);
BEGIN
   v_tomorrow:=v_today +1;
   SELECT first_name, salary INTO v_fname, v_emp_sal
     FROM employees WHERE employee_id=110;
   DBMS_OUTPUT.PUT_LINE(' Hello '|| v_fname);
   DBMS_OUTPUT.PUT_LINE('YOUR SALARY IS : '||v_emp_sal);
   DBMS_OUTPUT.PUT_LINE('YOUR CONTRIBUTION TOWARDS PF: '||v_emp_sal*v_basic_percent/100*v_pf_percent/100);
END;
/
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
SET SERVEROUTPUT ON

DECLARE
   v_dept_name departments.department_name%TYPE:= 'Education';
   v_dept_id NUMBER;
   v_max_deptno	NUMBER;
BEGIN
   SELECT MAX(department_id)  INTO v_max_deptno  FROM departments;
   DBMS_OUTPUT.PUT_LINE('The maximum department_id is : ' ||       
   v_max_deptno);
   v_dept_id := 10 + v_max_deptno;
   INSERT INTO departments (department_id, department_name, location_id) 
   VALUES (v_dept_id,v_dept_name, NULL);
   DBMS_OUTPUT.PUT_LINE (' SQL%ROWCOUNT gives ' || SQL%ROWCOUNT);
 END;
/
SELECT * FROM  departments  WHERE  department_id=280;
--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
--################################################################################
set SERVEROUTPUT ON;
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

--################################################################################
