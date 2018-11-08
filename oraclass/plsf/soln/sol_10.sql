--The SQL Script to run the solution for Practice 10

-- Execute the following code before starting this practice.
/*
DROP procedure add_dept;
DROP table dept;
DROP function check_sal;
*/

--Uncomment code below to run the solution for Task 1(a) of Practice 10

/*
CREATE PROCEDURE greet IS
   v_today DATE:=SYSDATE;
   v_tomorrow v_today%TYPE;
BEGIN
   v_tomorrow:=v_today +1;
   DBMS_OUTPUT.PUT_LINE(' Hello World ');
   DBMS_OUTPUT.PUT_LINE('TODAY IS : '|| v_today);
   DBMS_OUTPUT.PUT_LINE('TOMORROW IS : ' || v_tomorrow);
END;
*/

--Uncomment code below to run the solution for Task 1(e) of Practice 10

/*
SET SERVEROUTPUT ON

BEGIN
 greet;
END;
*/

--Uncomment code below to run the solution for Task 2(d) of Practice 10

/*
DROP PROCEDURE greet;
CREATE PROCEDURE greet (p_name VARCHAR2) IS
   v_today DATE:=SYSDATE;
   v_tomorrow v_today%TYPE;
BEGIN
   v_tomorrow:=v_today +1;
   DBMS_OUTPUT.PUT_LINE(' Hello '|| p_name);
   DBMS_OUTPUT.PUT_LINE('TODAY IS : '|| v_today);
   DBMS_OUTPUT.PUT_LINE('TOMORROW IS : ' || v_tomorrow);
END;
*/

--Uncomment code below to run the solution for Task 2(f) of Practice 10

/*
SET SERVEROUTPUT ON

BEGIN
 greet('Nancy');
END;
*/


