--This is the SQL Script to run the code_examples for Lesson 4

--Uncomment the code below to execute the code on slide 10_sa

/*
create sequence my_seq;
DECLARE
v_new_id NUMBER;
BEGIN
v_new_id := my_seq.NEXTVAL;
END;
/
*/

--Uncomment the code below to execute the code on slide 11_na

/*
SET SERVEROUTPUT ON

DECLARE
 v_salary NUMBER(6):=6000;
 v_sal_hike VARCHAR2(5):='1000';
 v_total_salary v_salary%TYPE;
BEGIN
 v_total_salary:=v_salary+v_sal_hike;
 DBMS_OUTPUT.PUT_LINE(v_total_salary);
END;
/
*/

--Uncomment the code below to execute the code on slide 16_sa

/*
SET SERVEROUTPUT ON

DECLARE
 v_outer_variable VARCHAR2(20):='GLOBAL VARIABLE';
BEGIN
  DECLARE
   v_inner_variable VARCHAR2(20):='LOCAL VARIABLE';
  BEGIN
   DBMS_OUTPUT.PUT_LINE(v_inner_variable);
   DBMS_OUTPUT.PUT_LINE(v_outer_variable);
  END;
 DBMS_OUTPUT.PUT_LINE(v_outer_variable); 
END;
/
*/

--Uncomment the code below to execute the code on slide 17_sa

/*
SET SERVEROUTPUT ON

DECLARE
 v_father_name VARCHAR2(20):='Patrick';
 v_date_of_birth DATE:='20-Apr-1972';
BEGIN
  DECLARE
   v_child_name VARCHAR2(20):='Mike';
   v_date_of_birth DATE:='12-Dec-2002';
  BEGIN
   DBMS_OUTPUT.PUT_LINE('Father''s Name: '||v_father_name);
   DBMS_OUTPUT.PUT_LINE('Date of Birth: '||v_date_of_birth);
   DBMS_OUTPUT.PUT_LINE('Child''s Name: '||v_child_name);
  END;
 DBMS_OUTPUT.PUT_LINE('Date of Birth: '||v_date_of_birth); 
END;
/
*/

--Uncomment the code below to execute the code on slide 19_sa

/*
SET SERVEROUTPUT ON

BEGIN <<outer>>
DECLARE
 v_father_name VARCHAR2(20):='Patrick';
 v_date_of_birth DATE:='20-Apr-1972';
BEGIN
  DECLARE
   v_child_name VARCHAR2(20):='Mike';
   v_date_of_birth DATE:='12-Dec-2002';
  BEGIN
   DBMS_OUTPUT.PUT_LINE('Father''s Name: '||v_father_name);
   DBMS_OUTPUT.PUT_LINE('Date of Birth: '
                        ||outer.v_date_of_birth);
   DBMS_OUTPUT.PUT_LINE('Child''s Name: '||v_child_name);
   DBMS_OUTPUT.PUT_LINE('Date of Birth: '||v_date_of_birth);
  END;
END;
END outer;
/
*/

--Uncomment the code below to execute the code on slide 20_sa

/*
BEGIN <<outer>>
DECLARE
v_sal NUMBER(7,2) := 60000;
v_comm NUMBER(7,2) := v_sal * 0.20;
v_message VARCHAR2(255) := ' eligible for commission';
BEGIN
DECLARE
v_sal NUMBER(7,2) := 50000;
v_comm NUMBER(7,2) := 0;
v_total_comp NUMBER(7,2) := v_sal + v_comm;
BEGIN
v_message := 'CLERK not'||v_message;
outer.v_comm := v_sal * 0.30;
END;
v_message := 'SALESMAN'||v_message;
END;
END outer;
/

--Execute the following code to drop the sequence created earlier.
drop sequence my_seq;
*/
