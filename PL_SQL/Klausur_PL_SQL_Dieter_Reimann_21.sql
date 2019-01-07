--###### Klausurdatei von: Dieter Reimann ###########################
/*    Inhalt:
    1. Dieser Abschnitt; Inhaltverzeichnis
    2. Readme-Section
    3. Housekeeping / Reversability
    4. Security-Settings
    5. Prerequisites to Run the System
    6. Main Procedure and Directory Initialisation
    7. Execution-Plan and Schduled Job for File Creation
    8. Sample of operated Outout-File
*/
--######______________________________________________________######

--###### Readme-Section #############################################
/*
Zur Lösung der Aufgabe bin ich wie folgt vorgegangen:
  -  Ich habe eine Tabelle entworfen, in der Feiertage, deren Gültigkeitszzeitraum
  -  und der Abrufstatus gespeichert werden kann.   
  -  Für eine Internettabelle der Feiertage habe ich in einer EXCEL-Tabelle ein 
  -  Formelgestütztes ETL Verfahren zur Erzeugung der Insert Statements erstellt
  -  Datei: Kalender.xslx
  -  Diese Daten habe ich dann in die Tabelle einlesen lassen
  -  Über eine Prozedur 'Write_Greetings' habe ich den nächsten Feiertag ermittelt
  -     dessen Name und das Datum in Variablen zwischengespeichert
  -     eine Datei mit dem Namen des Feiertags und der Endung '.csv' errzeugt und geöffnet
  -     einen infromationsheader in die Datei geschrieben
  -     über Bulk Collect die Employees in eine TempTabelle geladen
  -     in einem Loop die Employees_Namen mit dem statischen und dem variablem GrußText gemerged
  -     und die Datei geschlossen.
  -  Ein Zeitinterval wurde für die wiederholte Ausführung eines Jobs angelegt.
  -  Ein Job für den Scheduler wurde definiert und aktiviert.
  -  Nun wird täglich (falls nötig) automatisch eine Datei mit dem Namen des jeweiligen
  -     Feiertags angelegt und die Grußdaten darin abgespeichert.


*/
--######______________________________________________________######

--###### Housekeeping / Reversability ###############################

DROP SEQUENCE sequence_greetings;
DROP TABLE holidays;
DROP TRIGGER trigger_greetings_file;
Drop Directory 'greetings_dir';

--######______________________________________________________######

--###### Security-Settings ##########################################
set serveroutput on;
grant scheduler_admin to ora21;     --(executet by SYS in SQL_PLUS) 
grant create any trigger to ora21;  --(executet by SYS in SQL_PLUS)
grant create procedure to ora21;    --(executet by SYS in SQL_PLUS)
/
--######______________________________________________________######

--###### Prerequisites to Run the System ############################

CREATE SEQUENCE sequence_greetings;
/
CREATE TABLE holidays (holiday_id NUMBER(3), holiday_date DATE, holiday_weekday char(3), holiday_name VARCHAR2(50), year_valid varchar2(4), holiday_type char(3), holiday_status varchar2(10), active_in varchar2(256) );
/
    -- Input Statements created with attached EXCEL File: Kalender.xslx (Author: D.Reimann)
    
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
        --     Status: Done
COMMIT;
        --     Status: Done    
Select * from HOLIDAYs;      
        --     Status: Insert successful
--######______________________________________________________######

--###### Main Procedure and Directory Initialisation #################

CREATE OR REPLACE DIRECTORY greeting_dir AS 'C:\app\gitSQL\greetings';
GRANT READ, WRITE ON DIRECTORY greeting_dir TO public;
/
        -- Status: Executed successfully ----------------------------
        
        -- Modified Sample from Chapter 8  --------------------------  
        
create or replace PROCEDURE write_greetings IS
  file_ID UTL_FILE.FILE_TYPE;					--initialisation of Object-Variale reference package UtlFile, Sub = FileType

  TYPE temp_table_type IS TABLE OF employees%ROWTYPE;	-- initialisation of type-variable based on a row-type
  greetings_table temp_table_type;						-- creating a virtual table based on that type-variable

  temp_holiday holidays.holiday_name%TYPE := 'Platzhalter';   --
  temp_date    holidays.holiday_date%TYPE := to_date(sysdate + 7);
  v_output_dir VARCHAR2(50) := 'GREETING_DIR';

BEGIN
    SELECT holiday_name INTO temp_holiday   -- find next Holiday to set Output_File_Name
        FROM holidays 
        WHERE sysdate + 7 > holiday_date    -- check, whether or not a holiday is raising
        AND holiday_status like 'offen' -- ignore holidays, that have allready been selected        
        ;
    SELECT holiday_date INTO temp_date   -- find date of next Holiday to set Variable
        FROM holidays 
        WHERE temp_holiday like holiday_name    -- check, whether or not a holiday is raising
        ;
    file_ID := UTL_FILE.FOPEN(v_output_dir, temp_holiday||'.csv','W');   -- create File using Holiday_Name
    UTL_FILE.PUT_LINE(file_ID, 'Liebe(r) Mitabeiter(in), am '||temp_date||'ist '||temp_holiday);
    UTL_FILE.NEW_LINE(file_ID);
    IF to_char(to_date(temp_date),'DY') = 'Sun' then
        UTL_FILE.PUT_LINE(file_ID, '... da dies ein Sonntag ist, sende bitte die Grußkarten am '||to_date(temp_date-5)||' ab, damit sie rechtzeitig ankommen.');
        UTL_FILE.NEW_LINE(file_ID);
    ELSE
        UTL_FILE.PUT_LINE(file_ID, '...sende bitte die Grußkarten am '||to_date(temp_date-3)||' ab, damit sie rechtzeitig ankommen.');
        UTL_FILE.NEW_LINE(file_ID);
    END IF;
    UTL_FILE.PUT_LINE(file_ID,'______________________________________________________________________________________');
    UTL_FILE.NEW_LINE(file_ID);
    SELECT * BULK COLLECT INTO greetings_table
        FROM employees;    
    FOR i IN greetings_table.FIRST..greetings_table.LAST
    LOOP
        UTL_FILE.PUT_LINE(file_ID,'Liebe(r) '||greetings_table(i).first_name||' '||greetings_table(i).last_name ||'!');
        UTL_FILE.NEW_LINE(file_ID); UTL_FILE.NEW_LINE(file_ID);
        UTL_FILE.PUT_LINE(file_ID,'Am '||temp_date||' ist ' || temp_holiday||'.');
        UTL_FILE.NEW_LINE(file_ID);
        UTL_FILE.PUT_LINE(file_ID,'Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.');
        UTL_FILE.NEW_LINE(file_ID);
        UTL_FILE.PUT_LINE(file_ID,'Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.');
        UTL_FILE.NEW_LINE(file_ID);
        UTL_FILE.PUT_LINE(file_ID,';$');
        UTL_FILE.NEW_LINE(file_ID);
    END LOOP;
    UTL_FILE.FCLOSE(file_ID);
	update holidays set holiday_status = 'abgerufen'
		where holiday_name = temp_holiday AND holiday_date = temp_date;
    COMMIT;
End;

--######______________________________________________________######

--###### Execution-Plan and Schduled Job for File Creation ##########
   --    Anonymous Block to define execution Plan "GREETINGS_PLAN"
BEGIN
    DBMS_SCHEDULER.CREATE_SCHEDULE (
        repeat_interval  => 'FREQ=DAILY;BYDAY=MON,TUE,WED,THU,FRI',
        start_date => TO_TIMESTAMP_TZ('2019-01-03 10:26:33.000000000 EUROPE/BERLIN','YYYY-MM-DD HH24:MI:SS.FF TZR'),
        comments => 'Ausführungsplan für Grußkarten',
        schedule_name  => '"GREETINGS_PLAN"');
END;
  --     Status: Done
  
  --     Definition of Scheduled Job
  BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"CREATE_GREETINGS_FILE"',
            schedule_name => '"GREETINGS_PLAN"',
            job_type => 'STORED_PROCEDURE',
            job_action => 'WRITE_GREETINGS',
            number_of_arguments => 0,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => '');  
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"CREATE_GREETINGS_FILE"', 
             attribute => 'restartable', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"CREATE_GREETINGS_FILE"', 
             attribute => 'follow_default_timezone', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"CREATE_GREETINGS_FILE"', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"CREATE_GREETINGS_FILE"', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
    DBMS_SCHEDULER.enable(
             name => '"CREATE_GREETINGS_FILE"');
END;

--######______________________________________________________######

--###### Sample of operated Outout-File #############################
Liebe(r) Mitabeiter(in), am 06.01.19ist Heilige Drei Könige

... da dies ein Sonntag ist, sende bitte die Grußkarten am 06.01.19 ab, damit sie rechtzeitig ankommen.

...sende bitte die Grußkarten am 08.01.19 ab, damit sie rechtzeitig ankommen.

______________________________________________________________________________________

Liebe(r) Steven King!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Neena Kochhar!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Lex De Haan!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Alexander Hunold!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Bruce Ernst!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) David Austin!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Valli Pataballa!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Diana Lorentz!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Nancy Greenberg!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Daniel Faviet!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) John Chen!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Ismael Sciarra!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Jose Manuel Urman!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Luis Popp!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Den Raphaely!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Alexander Khoo!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Shelli Baida!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Sigal Tobias!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Guy Himuro!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Karen Colmenares!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Matthew Weiss!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Adam Fripp!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Payam Kaufling!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Shanta Vollman!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Kevin Mourgos!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Julia Nayer!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Irene Mikkilineni!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) James Landry!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Steven Markle!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Laura Bissot!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Mozhe Atkinson!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) James Marlow!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) TJ Olson!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Jason Mallin!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Michael Rogers!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Ki Gee!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Hazel Philtanker!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Renske Ladwig!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Stephen Stiles!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) John Seo!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Joshua Patel!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Trenna Rajs!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Curtis Davies!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Randall Matos!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Peter Vargas!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) John Russell!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Karen Partners!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Alberto Errazuriz!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Gerald Cambrault!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Eleni Zlotkey!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Peter Tucker!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) David Bernstein!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Peter Hall!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Christopher Olsen!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Nanette Cambrault!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Oliver Tuvault!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Janette King!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Patrick Sully!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Allan McEwen!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Lindsey Smith!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Louise Doran!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Sarath Sewall!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Clara Vishney!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Danielle Greene!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Mattea Marvins!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) David Lee!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Sundar Ande!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Amit Banda!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Lisa Ozer!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Harrison Bloom!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Tayler Fox!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) William Smith!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Elizabeth Bates!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Sundita Kumar!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Ellen Abel!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Alyssa Hutton!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Jonathon Taylor!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Jack Livingston!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Kimberely Grant!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Charles Johnson!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Winston Taylor!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Jean Fleaur!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Martha Sullivan!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Girard Geoni!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Nandita Sarchand!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Alexis Bull!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Julia Dellinger!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Anthony Cabrio!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Kelly Chung!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Jennifer Dilly!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Timothy Gates!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Randall Perkins!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Sarah Bell!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Britney Everett!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Samuel McCain!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Vance Jones!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Alana Walsh!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Kevin Feeney!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Donald OConnell!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Douglas Grant!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Jennifer Whalen!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Michael Hartstein!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Pat Fay!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Susan Mavris!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Hermann Baer!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) Shelley Higgins!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.

Liebe(r) William Gietz!


Am 06.01.19 ist Heilige Drei Könige.

Aus diesem Anlass senden wir Ihnen die unsere herzlichsten Grüße und wünschen frohe Festtage.

Auf ein Wiedersehen in alter Frische freut sich Ihr Hugo Habicht.



--######______________________________________________________######

