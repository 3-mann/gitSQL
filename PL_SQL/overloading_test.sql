CREATE TABLE overloading_test ( a number ,b VARCHAR2(20)) ;
INSERT INTO overloading_test (a, b) VALUES (1,'EINS') ;
INSERT INTO overloading_test (b, a ) VALUES ('ZWEI',2) ;

CREATE OR REPLACE PACKAGE fuer_otest 
IS 
PROCEDURE add_otest 
(p_a NUMBER
,p_b VARCHAR2
) ;
PROCEDURE add_otest
(p_b VARCHAR2
,p_a NUMBER) ;
END fuer_otest ;
/
CREATE OR REPLACE PACKAGE BODY fuer_otest 
IS 
PROCEDURE add_otest 
(p_a NUMBER
,p_b VARCHAR2
) 
IS 
BEGIN
INSERT INTO overloading_test (a, b) VALUES (p_a,p_b);
END add_otest
;
PROCEDURE add_otest
(p_b VARCHAR2
,p_a NUMBER)  
IS
BEGIN
INSERT INTO overloading_test (b, a ) VALUES (p_b,p_a) ;
END add_otest ;
END fuer_otest ;
/
exec fuer_otest.add_otest('DREI',3) 
exec fuer_otest.add_otest(4,'VIER') 
/
SELECT * FROM OVERLOADING_TEST ;
