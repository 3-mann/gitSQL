--This is the SQL Script to run the code_examples for Lesson 6

--Uncomment the code below to execute the code on slide 14_na 
/*

CREATE OR REPLACE PROCEDURE read_file(p_dir VARCHAR2, p_filename VARCHAR2) IS
  f_file UTL_FILE.FILE_TYPE;
  buffer VARCHAR2(200);
  lines  PLS_INTEGER := 0;
BEGIN
  DBMS_OUTPUT.PUT_LINE(' Start ');
  IF NOT UTL_FILE.IS_OPEN(f_file) THEN
    DBMS_OUTPUT.PUT_LINE(' Open ');
    f_file := UTL_FILE.FOPEN (p_dir, p_filename, 'R');
    DBMS_OUTPUT.PUT_LINE(' Opened ');
    BEGIN
      LOOP
        UTL_FILE.GET_LINE(f_file, buffer);
        lines := lines + 1;
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(lines, '099')||' '||buffer);
      END LOOP;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE(' ** End of File **');
    END;
    DBMS_OUTPUT.PUT_LINE(lines||' lines read from file');
    UTL_FILE.FCLOSE(f_file);
  END IF;
END read_file;
/
SHOW ERRORS
SET SERVEROUTPUT ON
EXECUTE read_file('REPORTS_DIR', 'instructor.txt')

*/

--Uncomment the code below to execute the code on slide 16-17_sa 
/*

REM
REM Note: Using the PUT_LINE is more natural for PL/SQL developers.
REM However, the orginal examples of using PUTF are shown in comments.
REM
CREATE OR REPLACE PROCEDURE sal_status(p_dir IN VARCHAR2, p_filename IN VARCHAR2) IS
  f_file UTL_FILE.FILE_TYPE;
  CURSOR cur_emp IS
    SELECT last_name, salary, department_id
    FROM employees ORDER BY department_id;
 v_newdeptno employees.department_id%TYPE;
 v_olddeptno employees.department_id%TYPE := 0;
BEGIN
  f_file:= UTL_FILE.FOPEN (p_dir, p_filename, 'W');
  UTL_FILE.PUT_LINE(f_file, 'REPORT: GENERATED ON ' ||SYSDATE);
  UTL_FILE.NEW_LINE (f_file);
  FOR emp_rec IN cur_emp LOOP
    IF emp_rec.department_id <> v_olddeptno THEN
      
       -- UTL_FILE.PUTF (file, 'DEPARTMENT: %s\n', emp_rec.department_id);
       
      UTL_FILE.PUT_LINE (f_file, 'DEPARTMENT: ' || emp_rec.department_id);
 UTL_FILE.NEW_LINE (f_file);
    END IF;
    
     -- UTL_FILE.PUTF (f_file,'  EMPLOYEE: %s earns: %s\n',
     --  emp_rec.last_name, emp_rec.salary);
     
     UTL_FILE.PUT_LINE (f_file,'  EMPLOYEE: ' || emp_rec.last_name || 
                         ' earns: ' || emp_rec.salary);
     v_olddeptno := emp_rec.department_id;
     UTL_FILE.NEW_LINE (f_file);
  END LOOP;
  UTL_FILE.PUT_LINE(f_file,'*** END OF REPORT ***');
  UTL_FILE.FCLOSE (f_file);
EXCEPTION
 WHEN UTL_FILE.INVALID_FILEHANDLE THEN
   RAISE_APPLICATION_ERROR(-20001,'Invalid File.');
 WHEN UTL_FILE.WRITE_ERROR THEN
   RAISE_APPLICATION_ERROR (-20002, 'Unable to write to file');
END sal_status;
/

*/

--Uncomment the code below to execute the code on slide 17_na 
-- Run the code under slide 14_15_sa before running this code example. 


/* EXECUTE sal_status('REPORTS_DIR', 'salreport2.txt')

