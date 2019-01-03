CREATE TABLE holidays(
     holiday_id NUMBER(4)
    ,holiday_date date
    ,holiday_name varchar2(30)
    );
drop sequence holiday_nun;

create SEQUENCE holiday_num
  INCREMENT BY 1 MAXVALUE 365 CYCLE;

/*
CREATE OR REPLACE PACKAGE Integritypackage AUTHID DEFINER AS
  Updateseq NUMBER;
END Integritypackage;
*/

Insert into holidays values(holiday_num.nextval, to_date('01-01-2019'), 'Neujahrstag');
Insert into holidays values(holiday_num.nextval, to_date('06-01-2019'), 'Heilige 3 Könige');
Insert into holidays values(holiday_num.nextval, to_date('17-04-2019'), 'Ostersonntag');
Insert into holidays values(holiday_num.nextval, to_date('01-01-2019'), 'Pfingstsonntag');
Insert into holidays values(holiday_num.nextval, to_date('01-01-2019'), 'Maria Himmelfahrt');
Insert into holidays values(holiday_num.nextval, to_date('01-01-2019'), 'Neujahrstag');
Insert into holidays values(holiday_num.nextval, to_date('01-01-2019'), 'Neujahrstag');
Insert into holidays values(holiday_num.nextval, to_date('01-01-2019'), 'Neujahrstag');
Insert into holidays values(holiday_num.nextval, to_date('01-01-2019'), 'Neujahrstag');
Insert into holidays values(holiday_num.nextval, to_date('01-01-2019'), 'Neujahrstag');
Insert into holidays values(holiday_num.nextval, to_date('24-12-2019'), 'Weihnachtsfest');
