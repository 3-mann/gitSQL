--This is the SQL Script to run the code_examples for Lesson 6

--Uncomment the code below to execute the code on slide 7_sa

/*
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
*/

--Uncomment the code below to execute the code on slide 8_sa

/*
SET SERVEROUTPUT ON

DECLARE
myage number:=31;
BEGIN
IF myage < 11
 THEN
    DBMS_OUTPUT.PUT_LINE(' I am a child ');  
 ELSE
    DBMS_OUTPUT.PUT_LINE(' I am not a child ');
END IF;
END;
/
*/

--Uncomment the code below to execute the code on slide 9_sa

/*
SET SERVEROUTPUT ON

DECLARE
myage number:=31;
BEGIN
IF myage < 11
 THEN
       DBMS_OUTPUT.PUT_LINE(' I am a child ');
   ELSIF myage < 20 
     THEN 
       DBMS_OUTPUT.PUT_LINE(' I am young ');
   ELSIF myage < 30
     THEN
       DBMS_OUTPUT.PUT_LINE(' I am in my twenties');
   ELSIF myage < 40
     THEN
       DBMS_OUTPUT.PUT_LINE(' I am in my thirties');
 ELSE
    DBMS_OUTPUT.PUT_LINE(' I am always young ');
END IF;
END;
/
*/

--Uncomment the code below to execute the code on slide 10_sa

/*
SET SERVEROUTPUT ON

DECLARE
myage number;
BEGIN
IF myage < 11
 THEN
    DBMS_OUTPUT.PUT_LINE(' I am a child ');  
 ELSE
    DBMS_OUTPUT.PUT_LINE(' I am not a child ');
END IF;
END;
/
*/

--Uncomment the code below to execute the code on slide 13_sa

/*
SET SERVEROUTPUT ON

SET VERIFY OFF
DECLARE
   grade CHAR(1) := UPPER('&grade');
   appraisal VARCHAR2(20);
BEGIN
   appraisal := 
      CASE grade
         WHEN 'A' THEN 'Excellent'
         WHEN 'B' THEN 'Very Good'
         WHEN 'C' THEN 'Good'
         ELSE 'No such grade'
      END;
DBMS_OUTPUT.PUT_LINE ('Grade: '|| grade || '   Appraisal ' || appraisal);
END;
/
*/

--Uncomment the code below to execute the code on slide 14_sa

/*
SET SERVEROUTPUT ON

DECLARE
   grade CHAR(1) := UPPER('&grade');
   appraisal VARCHAR2(20);
BEGIN
    appraisal := 
      CASE 
         WHEN grade = 'A' THEN 'Excellent'
         WHEN grade IN ('B','C') THEN 'Good'                  
         ELSE 'No such grade'   
     END;
DBMS_OUTPUT.PUT_LINE ('Grade: '|| grade || '  Appraisal ' || appraisal);
END;
/
*/

--Uncomment the code below to execute the code on slide 15_sa

/*
SET SERVEROUTPUT ON

DECLARE
   deptid NUMBER;
   deptname VARCHAR2(20);
   emps NUMBER;
   mngid NUMBER:= 108;
   
BEGIN
     CASE  mngid
         WHEN  108 THEN 
            SELECT department_id, department_name INTO deptid, deptname 
                FROM departments WHERE manager_id=108;
            SELECT count(*) INTO emps FROM employees WHERE 
               department_id=deptid;
         WHEN  200 THEN 
            SELECT department_id, department_name INTO deptid, deptname 
                FROM departments WHERE manager_id=200;
            SELECT count(*) INTO emps FROM employees WHERE 
               department_id=deptid;
         WHEN  121 THEN 
            SELECT department_id, department_name INTO deptid, deptname 
                FROM departments WHERE manager_id=121;
            SELECT count(*) INTO emps FROM employees WHERE 
               department_id=deptid;        
     END CASE;
DBMS_OUTPUT.PUT_LINE ('You are working in the '|| deptname||' department. There are '||emps ||' employees in this department');

END;
/
*/

--Uncomment the code below to execute the code on slide 22_sa

/*
select * FROM locations;
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
select * FROM locations;
rollback;
/
*/

--Uncomment the code below to execute the code on slide 24_sa

/*
SELECT * FROM locations;
DECLARE
v_countryid locations.country_id%TYPE := 'CA';
v_loc_id locations.location_id%TYPE;
v_new_city locations.city%TYPE := 'Montreal';
v_counter NUMBER := 1;
BEGIN
SELECT MAX(location_id) INTO v_loc_id FROM locations
WHERE country_id = v_countryid;
WHILE v_counter <= 3 LOOP
INSERT INTO locations(location_id, city, country_id)
VALUES((v_loc_id + v_counter), v_new_city, v_countryid);
v_counter := v_counter + 1;
END LOOP;
END;
/
SELECT * FROM locations;
ROLLBACK;
/
*/

--Uncomment the code below to execute the code on slide 27_sa

/*
Select * FROM locations;
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
Select * FROM locations;
/
ROLLBACK;
/
*/

--Uncomment the code below to execute the code on slide 33_sa

/*
SET SERVEROUTPUT ON

DECLARE
  v_total SIMPLE_INTEGER := 0;
BEGIN
  FOR i IN 1..10 LOOP
    v_total := v_total + i;
    dbms_output.put_line
     ('Total is: '|| v_total);
    CONTINUE WHEN i > 5;
    v_total := v_total + i; 
    dbms_output.put_line
     ('Out of Loop Total is:
      '|| v_total);    
  END LOOP;
END;
/
*/

--Uncomment the code below to execute the code on slide 34_sa

/*
SET SERVEROUTPUT ON

DECLARE 
 v_total NUMBER := 0;
BEGIN
 <<BeforeTopLoop>>
 FOR i IN 1..10 LOOP
   v_total := v_total + 1;
   dbms_output.put_line 
     ('Total is: ' || v_total);
   FOR j IN 1..10 LOOP
     CONTINUE BeforeTopLoop WHEN i + j > 5;
     v_total := v_total + 1;
   END LOOP;
 END LOOP;
END two_loop;
/
*/






