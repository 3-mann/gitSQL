DECLARE
TYPE EmpCurTyp IS REF CURSOR;
emp_cv EmpCurTyp;
emp_rec employees%ROWTYPE;
sql_stmt VARCHAR2(200);
sql_stm2 VARCHAR2(200); 
my_job VARCHAR2(10) := 'ST_CLERK';
my_deptno NUMBER(4) :=20 ;
BEGIN
sql_stmt := 'SELECT * FROM employees
WHERE job_id = :j';
sql_stm2 := 'SELECT * FROM emp2 
WHERE department_id = :k' ;
OPEN emp_cv FOR sql_stmt USING my_job;

LOOP
FETCH emp_cv INTO emp_rec;
EXIT WHEN emp_cv%NOTFOUND;
-- process record
END LOOP;
CLOSE emp_cv;
OPEN emp_cv FOR sql_stm2 USING my_deptno ;
LOOP
FETCH emp_cv INTO emp_rec;
EXIT WHEN emp_cv%NOTFOUND;
END LOOP;
CLOSE emp_cv;
END;

/

