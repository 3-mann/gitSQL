CREATE TABLE DREI_LOG (timestamp DATE, information VARCHAR2(2000));
/

CREATE TABLE DREI_Tabelle1 (zeitstempel DATE, zaehler number);
/
CREATE OR REPLACE TRIGGER DREI_CommitLog
    AFTER insert ON DREi_Tabelle1
    DECLARE
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        INSERT INTO DREI_log VALUES (SYSDATE, 'Insert on TAB1');
        COMMIT; 
    END; 
/

INSERT INTO DREI_Tabelle1 VALUES (sysdate,1);
/

select * from drei_log;
/