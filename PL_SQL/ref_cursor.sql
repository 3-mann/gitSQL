DECLARE 
v_emp emp%ROWTYPE ;
BEGIN 
SELECT e.() INTO v_emp FROM emp ;
END ;
/
DECLARE
	CURSOR c_emp IS
	SELECT e.ename,e.sal, d.loc  FROM emp e, dept d
    WHERE e.deptno=d.deptno ;
	/* das war die Deklaration des Cursors */
	/* jetzt wird der Tabellentyp deklariert */
    TYPE emp_dept_type IS RECORD  
    (v_ename emp.ename%TYPE
    ,v_sal emp.sal%TYPE 
    ,v_loc dept.loc%TYPE
    )
    ;
	TYPE emp_type IS TABLE OF emp_dept_type
	INDEX BY BINARY_INTEGER;
	/*es folgt das Instanziieren der INDEXBY-Tabelle*/
	local_emp_type emp_type;
	/*Variable als Datensatz- Zähler*/
	v_rownum BINARY_INTEGER :=0;
BEGIN
	FOR emp_rec IN c_emp
	LOOP
	v_rownum :=v_rownum +1;
	/* der komplette Datensatz wird in die Tabelle ?übernommen */
	local_emp_type(v_rownum) :=emp_rec;
    --DBMS_OUTPUT.PUT_LINE(local_emp_type(v_rownum).v_ename) ;
DBMS_OUTPUT.PUT_LINE(local_emp_type(v_rownum).v_ename||' verdient '||local_emp_type(v_rownum).v_sal
||' '|| local_emp_type(v_rownum).v_loc);
	END LOOP;
END;
/
desc emp 
desc dept 


/

DECLARE
       TYPE emp_aat IS TABLE OF emp%ROWTYPE
          INDEX BY PLS_INTEGER;
       v_emps    emp_aat;
       
       TYPE dept_aat IS TABLE OF dept%ROWTYPE
          INDEX BY PLS_INTEGER;
       v_depts    dept_aat;
       
       v_sql     CLOB;
       v_sql2     CLOB;
       v_cursor  BINARY_INTEGER := DBMS_SQL.OPEN_CURSOR;
       v_cursor2  BINARY_INTEGER := DBMS_SQL.OPEN_CURSOR;
       v_rc      SYS_REFCURSOR;
       v_execute BINARY_INTEGER;
       v_execute2 BINARY_INTEGER;
   BEGIN
     /* Setup EMP query... */
      --v_sql := 'SELECT * FROM emp WHERE job = :job';
      v_sql2:= 'SELECT * FROM dept WHERE deptno=10 ';
      /* Parse dynamic SQL... */
      --DBMS_SQL.PARSE(v_cursor, v_sql, DBMS_SQL.NATIVE);
      DBMS_SQL.PARSE(v_cursor2, v_sql2, DBMS_SQL.NATIVE);
      /* Process bind variable... */
      --DBMS_SQL.BIND_VARIABLE(v_cursor, 'JOB', '&job');
      /* Execute cursor and convert to ref cursor... */
      --v_execute := DBMS_SQL.EXECUTE(v_cursor);
      v_execute2 := DBMS_SQL.EXECUTE(v_cursor2);
      
      --hier Entscheidung welches Statement wird ausgeführt 
      v_rc := DBMS_SQL.TO_REFCURSOR(v_cursor2) ; --(v_cursor); --
      /* Now we can use much simpler code for accessing the data... */
      LOOP
         --FETCH v_rc BULK COLLECT INTO v_emps LIMIT 10;
         FETCH v_rc BULK COLLECT INTO v_depts LIMIT 2;
         --FOR i IN 1 .. v_emps.COUNT LOOP
           -- DBMS_OUTPUT.PUT_LINE('Emp = ' || v_emps(i).ename||' verdient '||v_emps(i).sal);
         --END LOOP;
         FOR i IN 1 .. v_depts.COUNT LOOP
           DBMS_OUTPUT.PUT_LINE('Dept = ' || v_depts(i).dname||' ist in  '||v_depts(i).loc);
         END LOOP;
         EXIT WHEN v_rc%NOTFOUND;
      END LOOP;
      CLOSE v_rc;
   END;
/

