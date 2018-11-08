DROP TABLE RETIRED_EMPLOYEES;

CREATE TABLE RETIRED_EMPLOYEES
   (	"EMPLOYEE_ID" NUMBER(7,0), 
	"FIRST_NAME" VARCHAR2(20), 
	"LAST_NAME" VARCHAR2(20), 
	"EMAIL" VARCHAR2(25), 
	"RETIRED_DATE" DATE, 
	"JOB_ID" VARCHAR2(20 BYTE), 
	"SALARY" NUMBER(8,2), 
	"MANAGER_ID" NUMBER(4,0), 
	"DEPARTMENT_ID" NUMBER(6,0));
  
  
INSERT INTO retired_employees VALUES 
        ( 301
        , 'Rick'
        , 'Dayle'
        , 'RDAYLE'
        , TO_DATE('18-03-2010', 'dd-MM-yyyy')
        , 'AD_PRES'
        , 8000
        , 124
        , 90
        );

INSERT INTO retired_employees VALUES 
        ( 302
        , 'Meena'
        , 'Rac'
        , 'MRAC'
        , TO_DATE('21-09-2011', 'dd-MM-yyyy')
        , 'AD_VP'
        , 11000
        , 149
        , 90
        );

INSERT INTO retired_employees VALUES 
        ( 303
        , 'Mex'
        , 'Haan'
        , 'MHAAN'
        , TO_DATE('13-01-2010', 'dd-MM-yyyy')
        , 'AD_VP'
        , 9500
        , 149
        , 80
        );

INSERT INTO retired_employees VALUES 
        ( 304
        , 'Alexandera'
        , 'Runold'
        , 'ARUNOLD'
        , TO_DATE('03-01-2011', 'dd-MM-yyyy')
        , 'IT_PROG'
        , 7500
        , 124
        , 60
        );

INSERT INTO retired_employees VALUES 
        ( 305
        , 'Bruk'
        , 'Ernst'
        , 'BERNST'
        , TO_DATE('21-05-2010', 'dd-MM-yyyy')
        , 'IT_PROG'
        , 6000
        , 149
        , 60
        );

INSERT INTO retired_employees VALUES 
        ( 306
        , 'Dravid'
        , 'Aust'
        , 'DAUST'
        , TO_DATE('25-06-2009', 'dd-MM-yyyy')
        , 'IT_PROG'
        , 4800
        , 124
        , 60
        );

INSERT INTO retired_employees VALUES 
        ( 307
        , 'Raj'
        , 'Patil'
        , 'RPATIL'
        ,  TO_DATE('05-02-2012', 'dd-MM-yyyy')
        , 'IT_PROG'
        , 4800
        , 201
        , 60
        );


INSERT INTO retired_employees VALUES 
        ( 308
        , 'Rahul'
        , 'Bose'
        , 'RBOSE'
        , TO_DATE('17-08-2012', 'dd-MM-yyyy')
        , 'FI_MGR'
        , 12008
        , 124
        , 100
        );

INSERT INTO retired_employees VALUES 
        ( 309
        , 'Dany'
        , 'Fav'
        , 'DFAV'
        , TO_DATE('16-08-2011', 'dd-MM-yyyy')
        , 'FI_ACCOUNT'
        , 9000
        , 101
        , 100
        );

INSERT INTO retired_employees VALUES 
        ( 310
        , 'James'
        , 'Ken'
        , 'JKHEN'
        , TO_DATE('28-09-2010', 'dd-MM-yyyy')
        , 'FI_ACCOUNT'
        , 8200
        , 101
        , 90
        );

INSERT INTO retired_employees VALUES 
        ( 311
        , 'Shana'
        , 'Garg'
        , 'SGARG'
        , TO_DATE('30-09-2010', 'dd-MM-yyyy')
        , 'FI_ACCOUNT'
        , 7700
        , 201
        , 100
        );

INSERT INTO retired_employees VALUES 
        ( 312
        , 'Supriya'
        , 'Ananth'
        , 'SANANTH'
        , TO_DATE('07-06-2014', 'dd-MM-yyyy')
        , 'FI_ACCOUNT'
        , 7800
        , 124
        , 100
        );

INSERT INTO retired_employees VALUES 
        ( 313
        , 'Lui'
        , 'Pops'
        , 'LPOPS'
        , TO_DATE('07-12-2010', 'dd-MM-yyyy')
        , 'FI_ACCOUNT'
        , 6900
        , 201
        , 100
        );

INSERT INTO retired_employees VALUES 
        ( 314
        , 'Del'
        , 'Raph'
        , 'DRAPH'
        , TO_DATE('07-12-2012', 'dd-MM-yyyy')
        , 'PU_MAN'
        , 11000
        , 101
        , 30
        );

INSERT INTO retired_employees VALUES 
        ( 315
        , 'Alex'
        , 'Khurl'
        , 'AKHURL'
        , TO_DATE('18-05-2011', 'dd-MM-yyyy')
        , 'PU_CLERK'
        , 3100
        , 149
        , 30
        );