SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE email_erzeugen_proc
(p1 IN emp.ename%TYPE
,p2 OUT VARCHAR2
)
IS 
v_emp emp%ROWTYPE ;
BEGIN
SELECT * INTO v_emp FROM emp WHERE ename=p1 ;
p2:=v_emp.job||v_emp.ename||'@meine_firma.de' ;
DBMS_OUTPUT.PUT_LINE(p2) ;
END ;
/
var b_email VARCHAR2(30) 
exec email_erzeugen_proc('KING',:b_email) 
print b_email 
/
CREATE OR REPLACE PROCEDURE name_suchen_proc
(p1 IN VARCHAR2
,p2 OUT VARCHAR2
)
IS 
v_emp emp%ROWTYPE ;
CURSOR c1
IS
SELECT * FROM emp WHERE ename=SUBSTR(p1,LENGTH(job)+1,LENGTH(ename)) ;
BEGIN 
FOR emp_rec IN c1 LOOP 
DBMS_OUTPUT.PUT_LINE(c1%ROWCOUNT||' '||p1||' '||LENGTH(emp_rec.job)||' '||LENGTH(emp_rec.ename));
DBMS_OUTPUT.PUT_LINE(SUBSTR(p1,LENGTH(emp_rec.job)+1,LENGTH(emp_rec.ename)) );
DBMS_OUTPUT.PUT_LINE(emp_rec.ename) ;
p2:=SUBSTR(p1,LENGTH(emp_rec.job)+1,LENGTH(emp_rec.ename));
END LOOP ;
END ;
/
print b_email 
var b_name VARCHAR2(30) 
exec name_suchen_proc(:b_email,:b_name) 

print b_name
--SELECT SUBSTR('CLERKSMITH@meine_firma.de',LENGTH(job)+1,LENGTH(ename)) FROM emp
--WHERE ename='SMITH' ;