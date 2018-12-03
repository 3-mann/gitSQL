SET SERVEROUTPUT ON

BEGIN <<Rahmen>>
DECLARE
    v_Date DATE:=sysdate
    DECLARE
         v_father_name VARCHAR2(20):='Patrick';
         v_date_of_birth DATE:='20-Apr-1972';
    BEGIN <<Vater>>
          DECLARE
               v_child_name VARCHAR2(20):='Mike';
               v_date_of_birth DATE:='12-Dez-2002';
          BEGIN <<Kind>>
               DBMS_OUTPUT.PUT_LINE('Father''s Name: '||Rahmen.v_Date);
               DBMS_OUTPUT.PUT_LINE('Father''s Name: '||Kind.v_father_name);
               DBMS_OUTPUT.PUT_LINE('Father''s Name: '||Kind.v_father_name);
               DBMS_OUTPUT.PUT_LINE('Date of Birth:  '||Vater.v_date_of_birth);
               DBMS_OUTPUT.PUT_LINE('Child''s Name:  '||Kind.v_child_name);
               DBMS_OUTPUT.PUT_LINE('Date of Birth:  '||Kind.v_date_of_birth);
          END Kind;
    END Vater;
END Rahmen;
/

--##########################################################

BEGIN <<outer1>> 
DECLARE 
 v_father_name VARCHAR2(20):='Hans'; 
 v_date_of_birth DATE:='13-MAI-1972'; 
 BEGIN <<outer2>>
DBMS_OUTPUT.PUT_LINE('in outer2') ;
  DECLARE 
   v_child_name VARCHAR2(20):='John'; 
   v_date_of_birth DATE:='11-APR-2002'; 
        BEGIN <<outer3>>
        DBMS_OUTPUT.PUT_LINE('in outer3- Label') ;
            DECLARE
            v_child_name VARCHAR2(20) :='Peter' ;
            BEGIN 
            DBMS_OUTPUT.PUT_LINE('Father''s Name: '||v_father_name); 
            DBMS_OUTPUT.PUT_LINE('Date of Birth:  '||outer1.v_date_of_birth); 
            DBMS_OUTPUT.PUT_LINE('Child''s Name:  '||outer1.v_father_name); 
            DBMS_OUTPUT.PUT_LINE('Date of Birth:  '||outer2.v_date_of_birth); 
            END ;
         END outer3;
  END outer2 ;
END outer1;
