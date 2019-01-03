--####### Security Settings ### Execute with appropriate privilege ! ####################
set serveroutput on;
grant scheduler_admin to ora21;   
grant create any trigger to ora21;
grant create procedure to ora21;
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
CREATE TABLE holidays (holiday_id NUMBER(3), holiday_date DATE, day_of_week char(3), holiday_name VARCHAR2(50), year_valid varchar2(4), holiday_type char(3), holiday_status varchar2(10), active_in varchar2(256) );
/

Insert into holidays values(sequence_greetings.nextval, to_date('01.01.2019'),'Tue','Neujahr','fix','ges','abgerufen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('06.01.2019'),'Sun','Heilige Drei Könige','fix','ges','offen','Baden-Württemberg, Bayern und Sachsen-Anhalt');
Insert into holidays values(sequence_greetings.nextval, to_date('14.02.2019'),'Thu','Valentinstag','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('28.02.2019'),'Thu','Weiberfastnacht','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('02.03.2019'),'Sat','Fastnachtssamstag','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('03.03.2019'),'Sun','Fastnachtssonntag','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('04.03.2019'),'Mon','Rosenmontag','2019','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('05.03.2019'),'Tue','Fastnacht','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('06.03.2019'),'Wed','Aschermittwoch','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('14.04.2019'),'Sun','Palmsonntag','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('18.04.2019'),'Thu','Gründonnerstag','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('19.04.2019'),'Fri','Karfreitag','2019','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('20.04.2019'),'Sat','Karsamstag','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('21.04.2019'),'Sun','Ostersonntag','2019','sym','offen','Brandenburg');
Insert into holidays values(sequence_greetings.nextval, to_date('22.04.2019'),'Mon','Ostermontag','2019','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('30.04.2019'),'Tue','Walpurgisnacht','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('01.05.2019'),'Wed','Tag der Arbeit','fix','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('12.05.2019'),'Sun','Muttertag','2019','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('30.05.2019'),'Thu','Christi Himmelfahrt','2019','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('09.06.2019'),'Sun','Pfingstsonntag','2019','sym','offen','Brandenburg');
Insert into holidays values(sequence_greetings.nextval, to_date('10.06.2019'),'Mon','Pfingstmontag','2019','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('17.06.2019'),'Mon','Aufstand des 17. Juni','fix','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('20.06.2019'),'Thu','Fronleichnam','2019','ges','offen','Baden-Württemberg, Bayern, Hessen, Nordrhein-Westfalen, Rheinland-Pfalz und Saarland');
Insert into holidays values(sequence_greetings.nextval, to_date('08.08.2019'),'Thu','Augsburger Friedensfest ','fix','ges','offen','Bayern');
Insert into holidays values(sequence_greetings.nextval, to_date('15.08.2019'),'Thu','Mariä Himmelfahrt ','2019','ges','offen','Bayern und Saarland');
Insert into holidays values(sequence_greetings.nextval, to_date('03.10.2019'),'Thu','Tag der Deutschen Einheit','2019','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('06.10.2019'),'Sun','Erntedankfest','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('31.10.2019'),'Thu','Halloween','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('31.10.2019'),'Thu','Reformationstag','2019','sym','offen','Brandenburg, Mecklenburg-Vorpommern, Sachsen, Sachsen-Anhalt, Thüringen, Bremen, Niedersachsen, Schleswig-Holstein und Hamburg');
Insert into holidays values(sequence_greetings.nextval, to_date('01.11.2019'),'Fri','Allerheiligen','2019','ges','offen','Baden-Württemberg, Bayern, Nordrhein-Westfalen, Rheinland-Pfalz und Saarland');
Insert into holidays values(sequence_greetings.nextval, to_date('02.11.2019'),'Sat','Allerseelen  ','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('11.11.2019'),'Mon','Martinstag','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('17.11.2019'),'Sun','Volkstrauertag','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('20.11.2019'),'Wed','Buß- und Bettag','2019','sym','offen','Sachsen');
Insert into holidays values(sequence_greetings.nextval, to_date('24.11.2019'),'Sun','Totensonntag','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('01.12.2019'),'Sun','1. Advent','2019','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('06.12.2019'),'Fri','Nikolaus','2019','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('24.12.2019'),'Tue','Heiligabend','fix','sym','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('25.12.2019'),'Wed','1. Weihnachtstag','fix','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('26.12.2019'),'Thu','2. Weihnachtstag','fix','ges','offen','Alle Bundesländer');
Insert into holidays values(sequence_greetings.nextval, to_date('31.12.2019'),'Tue','Silvester','fix','sym','offen','Alle Bundesländer');

COMMIT;
/ 

Select * from HOLIDAYs;

CREATE DIRECTORY greeting_dir AS 'C:\app\gitSQL\greetings';
GRANT READ, WRITE ON DIRECTORY greeting_dir TO public;
/
CREATE OR REPLACE PROCEDURE write_greetings IS
  f UTL_FILE.FILE_TYPE;
  TYPE greet_emps_type IS TABLE OF employees%ROWTYPE;
  greetings_table greet_emps_type;
  
  v_holiday holidays.holiday_name%TYPE := 'Platzhalter';
  v_out_dir VARCHAR2(30) := 'greeting_dir';
  v_file VARCHAR2(12) := 'greetings_file.csv';
  
BEGIN
  SELECT holiday_name INTO v_holiday
    FROM holidays WHERE holiday_date - sysdate < 10;
  f := UTL_FILE.FOPEN(v_out_dir, v_file,'W');
  UTL_FILE.PUT_LINE(f, 'Dear Employees for Tomorrow, ' || TO_DATE(SYSDATE+1) ||
                        ', We Are Happy to Announce: ');
  UTL_FILE.NEW_LINE(f);
  DBMS_OUTPUT.PUT_LINE('Hello!');
  SELECT * BULK COLLECT INTO greetings_table
    FROM employees;
  FOR i IN greetings_table.FIRST..greetings_table.LAST
  LOOP
    UTL_FILE.PUT_LINE(f, 'Liebe(r) ' || greetings_table(i).first_name || ' ' ||
                                    greetings_table(i).last_name ||
                         ' we wish you a happy ' || v_holiday || '!');
  END LOOP;
  UTL_FILE.NEW_LINE(f);
  UTL_FILE.PUT_LINE(f, '*** END OF REPORT ***');
  UTL_FILE.FCLOSE(f);
END;
/
SHOW ERRORS
--###########################################################################

EXEC write_greetings;
select * from holidays where holiday_date - sysdate < 10;

--###########################################################################
CREATE OR REPLACE TRIGGER trigger_greetings_file
  AFTER LOGON
  ON DATABASE
    CALL write_greetings
/

--###### Define scheduled Job for Greetings_file #############################

execute DBMS_SCHEDULER.CREATE_JOB (job_name => 'greetings_job', 
          job_type => '?????', 
          job_action => '?????', 
          start_date => to_timestamp_tz('2019-03-03 Europe/Berlin', 'YYYY-MM-DD TZR'),,
          repeat_interval => 'FREQ = DAILY; INTERVAL = 1',
          auto_drop => FALSE,
          enabled => TRUE)  
/
--###### End of Schedule Definition ##########################################
