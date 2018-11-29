CREATE TABLE interval_table(
    id NUMBER,
    i1 INTERVAL YEAR TO MONTH,
    i2 INTERVAL DAY TO SECOND
);
DESC interval_table;
/*
Name Null? Typ      
---- ----- ---------------------------- 
ID         NUMBER                       
I1         INTERVAL YEAR(2) TO MONTH    
I2         INTERVAL DAY(2) TO SECOND(6) 
*/

INSERT INTO interval_table VALUES(1, '5-6', '2 10:30:30');
INSERT INTO interval_table VALUES(2, INTERVAL '607' MONTH, INTERVAL '150' HOUR);
COMMIT;

SELECT i.*, SYSDATE, SYSDATE+i1, SYSDATE-i2 FROM interval_table i;