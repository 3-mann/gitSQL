CREATE OR REPLACE PROCEDURE eins 
(p1 IN      NUMBER 
,p2 OUT     NUMBER 
)
IS
BEGIN 
SELECT deptno INTO p2 FROM dept WHERE deptno=p1 ;
DBMS_OUTPUT.PUT_LINE(p2) ;
END ;
/
var b_2 NUMBER ;
exec eins(10,:b_2) 
print b_2 

CREATE OR REPLACE PROCEDURE zwei 
(p1 IN      NUMBER 
,p2 OUT     VARCHAR2
)
IS 
v_emp emp%ROWTYPE;
CURSOR c1 
IS 
SELECT *  FROM emp WHERE deptno=p1 ;
BEGIN 
FOR emp_rec IN c1 LOOP
DBMS_OUTPUT.PUT_LINE(emp_rec.ename) ;
END LOOP ;
SELECT SUM(sal) INTO v_emp.sal FROM emp WHERE deptno=p1;
DBMS_OUTPUT.PUT_LINE(v_emp.sal) ;
p2:=v_emp.sal;
END ;
/
var b_ename VARCHAR2(20) 
exec zwei(:b_2,:b_ename) 
print b_2 b_ename ;
