--The SQL Script to run the solution for Additional Practice 6

--Uncomment code below to run the solution for Task 1 in Additional Practice 6-1

/*
SET SERVEROUTPUT ON
DECLARE
	v_YEAR NUMBER(4) := &P_YEAR;
	v_REMAINDER1 NUMBER(5,2);
	v_REMAINDER2 NUMBER(5,2);
	v_REMAINDER3 NUMBER(5,2);
BEGIN
 	v_REMAINDER1 := MOD(v_YEAR,4);
	v_REMAINDER2 := MOD(v_YEAR,100);
	v_REMAINDER3 := MOD(v_YEAR,400);
	IF ((v_REMAINDER1 = 0 AND v_REMAINDER2 <> 0 ) OR v_REMAINDER3 = 0) THEN	
		DBMS_OUTPUT.PUT_LINE(v_YEAR || ' is a leap year');
	ELSE
		DBMS_OUTPUT.PUT_LINE (v_YEAR || ' is not a leap year');		
	END IF;
END;
/
*/


--Uncomment code below to run the solution for Additional Practice 6-2

/*
SET SERVEROUTPUT ON
DECLARE
  V_SAL        NUMBER(7,2) := &B_SALARY;
  V_BONUS      NUMBER(7,2);
  V_ANN_SALARY NUMBER(15,2);
BEGIN
  V_ANN_SALARY       := V_SAL * 12;
  IF V_ANN_SALARY    >= 20000 THEN
    V_BONUS          := 2000;
  ELSIF V_ANN_SALARY <= 19999 AND V_ANN_SALARY >=10000 THEN
    V_BONUS          := 1000;
  ELSE
    V_BONUS := 500;
  END IF;
  DBMS_OUTPUT.PUT_LINE ('The Bonus is $  ' || TO_CHAR(V_BONUS));
END;
/
*/
