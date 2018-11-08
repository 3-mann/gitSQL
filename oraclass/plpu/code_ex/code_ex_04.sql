--This is the SQL Script to run the code_examples for Lesson 4

--Uncomment the code below to execute the code on slide 14_sa 
/*

CREATE OR REPLACE PACKAGE comm_pkg IS
  v_std_comm NUMBER := 0.10;  --initialized to 0.10
  PROCEDURE reset_comm(p_new_comm NUMBER);
END comm_pkg;
/

*/

--Uncomment the code below to execute the code on slide 16_sa 
-- Run the code under slide 14_sa before running this code example. 
/*

CREATE OR REPLACE PACKAGE BODY comm_pkg IS
  FUNCTION validate(p_comm NUMBER) RETURN BOOLEAN IS
    v_max_comm employees.commission_pct%type;
  BEGIN
    SELECT MAX(commission_pct) INTO v_max_comm
    FROM   employees;
    RETURN (p_comm BETWEEN 0.0 AND v_max_comm);
  END validate;

  PROCEDURE reset_comm (p_new_comm NUMBER) IS BEGIN
    IF validate(p_new_comm) THEN
      v_std_comm := p_new_comm; -- reset public var
    ELSE  RAISE_APPLICATION_ERROR(
            -20210, 'Bad Commission');
    END IF;
  END reset_comm;
END comm_pkg;
/

*/

--Uncomment the code below to execute the code on slide 17_sa 
/*
CREATE OR REPLACE PACKAGE BODY comm_pkg IS
  FUNCTION validate(p_comm NUMBER) RETURN BOOLEAN IS
    v_max_comm employees.commission_pct%type;
  BEGIN
    SELECT MAX(commission_pct) INTO v_max_comm
    FROM   employees;
    RETURN (p_comm BETWEEN 0.0 AND v_max_comm);
  END validate;

  PROCEDURE reset_comm (p_new_comm NUMBER) IS BEGIN
    IF validate(p_new_comm) THEN
      v_std_comm := p_new_comm; -- reset public var
    ELSE  RAISE_APPLICATION_ERROR(
            -20210, 'Bad Commission');
    END IF;
  END reset_comm;
END comm_pkg;
/

*/

--Uncomment the code below to execute the code on slide 17_sb 
/*

EXECUTE comm_pkg.reset_comm(0.15)

*/

--Uncomment the code below to execute the code on slide 19_sa 
/*

CREATE OR REPLACE PACKAGE global_consts IS
  c_mile_2_kilo    CONSTANT  NUMBER  :=  1.6093;
  c_kilo_2_mile    CONSTANT  NUMBER  :=  0.6214;
  c_yard_2_meter   CONSTANT  NUMBER  :=  0.9144;
  c_meter_2_yard   CONSTANT  NUMBER  :=  1.0936;
END global_consts;
/

*/

--Uncomment the code below to execute the code on slide 19_sb 
-- Run the code under slide 19_sa before running this code example. 
/*

SET SERVEROUTPUT ON

BEGIN
  DBMS_OUTPUT.PUT_LINE('20 miles = ' ||
        20 * global_consts.c_mile_2_kilo || ' km');
END;
/

*/

--Uncomment the code below to execute the code on slide 19_sc 
-- Run the code under slide 19_sa before running this code example.
/*

SET SERVEROUTPUT ON

CREATE FUNCTION mtr2yrd(p_m NUMBER) RETURN NUMBER IS
BEGIN
  RETURN (p_m * global_consts.c_meter_2_yard);
END mtr2yrd;
/
EXECUTE DBMS_OUTPUT.PUT_LINE(mtr2yrd(1))

*/

--Uncomment the code below to execute the code on slide 20_sa 
-- Run the code under slide 14_sa before running this code example. 
/*

SELECT text
FROM   user_source
WHERE  name = 'COMM_PKG' AND type = 'PACKAGE'
ORDER BY LINE;

*/

--Uncomment the code below to execute the code on slide 20_sb 
-- Run the code under slide 16_sa before running this code example. 
/*

SELECT text
FROM   user_source
WHERE  name = 'COMM_PKG' AND type = 'PACKAGE BODY'
ORDER BY LINE;

*/
