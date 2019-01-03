--####### Security Settings ### Execute with appropriate privilege ! ####################
set serveroutput on;
grant scheduler_admin to ora41;   -- Command needs to be executeted by sysdba
grant create any trigger to ora41;
grant create procedure to ora41;
/
--###### End of Security Settings #######################################################

--###### Cleanup Definitions to Re-Run all Tasks ########################################
DROP SEQUENCE sequence_greetings;
DROP TABLE holidays;
DROP TRIGGER trigger_greetings_file;
Drop Directory 'greetings_dir';

EXEC DBMS_SCHEDULER.drop_job(job_name => 'greetings_job'); 
/
--###### End of Cleanup #################################################################

--###### Create Prerequisites for recurring Tasks #######################################
CREATE SEQUENCE sequence_greetings;
/
CREATE TABLE holidays (holiday_id NUMBER(3), holiday_date DATE, holiday_name VARCHAR2(30));
/

INSERT INTO holidays VALUES (sequence_greetings.NEXTVAL, TO_DATE('06.01.2019'), 'Heilige 3 Könige');
INSERT INTO holidays VALUES (sequence_greetings.NEXTVAL, TO_DATE('17.04.2019'), 'Ostersonntag');
INSERT INTO holidays VALUES (sequence_greetings.NEXTVAL, TO_DATE('29.05.2019'), 'Pfingstsonntag');
INSERT INTO holidays VALUES (sequence_greetings.NEXTVAL, TO_DATE('15.08.2019'), 'Maria Himmelfahrt');
INSERT INTO holidays VALUES (sequence_greetings.NEXTVAL, TO_DATE('24.12.2019'), 'Weihnachten');
COMMIT;
/ 
CREATE OR REPLACE DIRECTORY greeting_dir AS 'C:\app\gitSQL\greetings';
GRANT READ, WRITE ON DIRECTORY greeting_dir TO public;
/
CREATE OR REPLACE PROCEDURE write_greetings IS
  file_ID UTL_FILE.FILE_TYPE;
  
  TYPE greet_emps_type IS TABLE OF employees%ROWTYPE;
  greetings_table greet_emps_type;
  
  v_holiday holidays.holiday_name%TYPE := 'Feiertag';
  v_out_dir VARCHAR2(36) := 'greeting_dir';
  v_file VARCHAR2(12) := 'greetings_file.csv';
  
BEGIN
  SELECT holiday_name INTO v_holiday
    FROM holidays WHERE holiday_date - sysdate < 10;
  file_ID := UTL_FILE.FOPEN(v_out_dir, v_file,'W');
  UTL_FILE.PUT_LINE(file_ID, 'Dear Employees for Tomorrow, ' || TO_DATE(SYSDATE+1) ||
                        ', We Are Happy to Announce: ');
  UTL_FILE.NEW_LINE(file_ID);
  DBMS_OUTPUT.PUT_LINE('Hello!');
  SELECT * BULK COLLECT INTO greetings_table
    FROM employees;
  FOR i IN greetings_table.FIRST..greetings_table.LAST
  LOOP
    UTL_FILE.PUT_LINE(file_ID, 'Liebe(r) ' || greetings_table(i).first_name || ' ' ||
                                    greetings_table(i).last_name ||
                         ' we wish you a happy ' || v_holiday || '!');
  END LOOP;
  UTL_FILE.NEW_LINE(file_ID);
  UTL_FILE.PUT_LINE(file_ID, '*** END OF REPORT ***');
  UTL_FILE.FCLOSE(file_ID);
END;
/
--###########################################################################
SHOW ERRORS
EXEC write_greetings;
select * from holidays where holiday_date - sysdate < 10;

--###########################################################################
CREATE OR REPLACE TRIGGER trigger_greetings_file
  AFTER LOGON
  ON SCHEMA
    CALL write_greetings
/

--###### Define scheduled Job for Greetings_file #############################

execute DBMS_SCHEDULER.CREATE_JOB (job_name => 'greetings_job', 
          job_type => 'PLSQL_BLOCK', 
          job_action => Print('Dear Admin, this Message is for You'), 
          start_date => SYSDATE,
          repeat_interval => 'FREQ = DAILY; INTERVAL = 1',
          auto_drop => FALSE, -- Default ist TRUE
          enabled => TRUE)    -- Default ist FALSE
/
--###### End of Schedule Definition ##########################################
