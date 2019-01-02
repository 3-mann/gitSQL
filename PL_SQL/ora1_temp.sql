CREATE SEQUENCE holiday_seq;
DROP SEQUENCE holiday_seq;
SELECT holiday_seq.NEXTVAl FROM DUAL;
SELECT holiday_seq.CURRVAl FROM DUAL;
CREATE TABLE public_holidays (pbhd_id NUMBER, pbhd_date DATE, pbhd_holiday VARCHAR2(36));
DROP TABLE public_holidays;
SELECT * FROM public_holidays;
INSERT INTO public_holidays VALUES (holiday_seq.NEXTVAL, TO_DATE('06.01.2019'), 'Hlg. Königstag');
INSERT INTO public_holidays VALUES (holiday_seq.NEXTVAL, TO_DATE('17.04.2019'), 'Ostersonntag');
INSERT INTO public_holidays VALUES (holiday_seq.NEXTVAL, TO_DATE('29.05.2019'), 'Pfingstsonntag');
INSERT INTO public_holidays VALUES (holiday_seq.NEXTVAL, TO_DATE('15.08.2019'), 'Mariä Himmelfahrt');
INSERT INTO public_holidays VALUES (holiday_seq.NEXTVAL, TO_DATE('24.12.2019'), 'Weihnachten');
COMMIT;
 
CREATE OR REPLACE DIRECTORY out_dir AS 'C:\app\gitSQL\greetings';
GRANT READ, WRITE ON DIRECTORY out_dir TO public;
set serveroutput on
CREATE OR REPLACE PROCEDURE happy_holiday
  IS
  f UTL_FILE.FILE_TYPE;
  TYPE emp_tab_type IS TABLE OF employees%ROWTYPE;
  emp_table emp_tab_type;
  v_holiday public_holidays.pbhd_holiday%TYPE := 'Feiertag';
  v_out_dir VARCHAR2(36) := 'OUT_DIR';
  v_file VARCHAR2(12) := 'Holiday.txt';
BEGIN
  SELECT pbhd_holiday INTO v_holiday
    FROM public_holidays WHERE pbhd_date - sysdate < 10;
  f := UTL_FILE.FOPEN(v_out_dir, v_file,'W');
  UTL_FILE.PUT_LINE(f, 'Dear Employees for Tomorrow, ' || TO_DATE(SYSDATE+1) ||
                        ', We Are Happy to Announce: ');
  UTL_FILE.NEW_LINE(f);
  DBMS_OUTPUT.PUT_LINE('Hello!');
  SELECT * BULK COLLECT INTO emp_table
    FROM employees;
--  FOR i IN 1..emp_table.COUNT
  FOR i IN emp_table.FIRST..emp_table.LAST
  LOOP
    UTL_FILE.PUT_LINE(f, 'Dear ' || emp_table(i).first_name || ' ' ||
                                    emp_table(i).last_name ||
                         ' we wish you a happy ' || v_holiday || '!');
--    DBMS_OUTPUT.PUT_LINE(' Hallo, es wurde eine Grußkartendatei erstellt ');
  END LOOP;
  UTL_FILE.NEW_LINE(f);
  UTL_FILE.PUT_LINE(f, '*** END OF REPORT ***');
  UTL_FILE.FCLOSE(f);
END;
/
SHOW ERRORS
EXEC happy_holiday;
select * from public_holidays where pbhd_date - sysdate < 10;

CREATE OR REPLACE TRIGGER holiday_logon_trig
  AFTER LOGON
  ON SCHEMA
  CALL happy_holiday
/
DROP TRIGGER holiday_logon_trig;