--The SQL Script to run the code_examples for Lesson 7

--Uncomment code below to run the code for slide 6_sa for lesson 7
--Execute the code for slide 6_nb before executing this code


/*	             

INSERT INTO (SELECT l.location_id, l.city, l.country_id
             FROM   loc l
             JOIN   countries c
             ON(l.country_id = c.country_id)
             JOIN regions USING(region_id)
             WHERE region_name = 'Europe')
VALUES (3300, 'Cardiff', 'UK');
*/

--Uncomment code below to run the code for slide 6_na for lesson 7


/*	

INSERT INTO european_cities
VALUES (3300,'Cardiff','UK');

*/

--Uncomment code below to run the code for slide 6_nb for lesson 7
--If you get any warning message, please ignore it

/*	

DROP TABLE loc;
CREATE TABLE loc AS SELECT * FROM locations;
                   
*/


--Uncomment code below to run the code for slide 7_sa for lesson 7
--If you execute both code for slide 06_sa.sql and 06_na.sql you will get
--two rows for location_id 3300

/*	


SELECT location_id, city, country_id
FROM   loc;

*/   

--Uncomment code below to run the code for slide 7_na for lesson 7
--If you execute both code for slide 06_sa.sql and 06_na.sql you will get
--two rows for location_id 3300

/*	            


SELECT l.location_id, l.city, l.country_id
FROM   loc l
JOIN   countries c
ON(l.country_id = c.country_id)
JOIN regions USING(region_id)
WHERE region_name = 'Europe';

*/

--Uncomment code below to run the code for slide 9_sa for lesson 7

/*	
                     
INSERT INTO ( SELECT location_id, city, country_id
              FROM   loc 
              WHERE  country_id IN 
              (SELECT country_id 
               FROM countries 
               NATURAL JOIN regions
               WHERE region_name = 'Europe')
               WITH CHECK OPTION )
VALUES (3600, 'Washington', 'US');
               
*/

--Uncomment code below to run the code for slide 9_na for lesson 7
-- Turn the autocommit option off, and execute the insert statement


/*
SET AUTOCOMMIT OFF
INSERT INTO (SELECT location_id, city, country_id
             FROM   loc 
             WHERE  country_id IN
             (SELECT country_id 
              FROM countries 
              NATURAL JOIN regions
              WHERE region_name = 'Europe')
              WITH CHECK OPTION)
VALUES (3500, 'Berlin', 'DE');


*/

--Uncomment code below to run the code for slide 10_na for lesson 7
/*

CREATE OR REPLACE VIEW european_cities 
AS
SELECT location_id, city, country_id
FROM   locations 
WHERE  country_id IN
  (SELECT country_id 
   FROM countries 
   NATURAL JOIN regions
   WHERE region_name = 'Europe')
WITH CHECK OPTION;
            
*/


--Uncomment code below to run the code for slide 10_nb for lesson 7
/*
INSERT INTO european_cities
VALUES (3400,'New York','US');

*/


--Uncomment code below to run the code for slide 13_sa for lesson 7
--If you get any warning message, please ignore it

/*

drop table empl6;

create table empl6 as select * from employees;

ALTER TABLE empl6
ADD(department_name VARCHAR2(25));

*/


--Uncomment code below to run the code for slide 13_sb for lesson 7
/*
UPDATE empl6 e
SET    department_name = 
              (SELECT department_name 
	       FROM   departments d
	       WHERE  e.department_id = d.department_id);
*/

--Uncomment code below to run the code for slide 13_na for lesson 7
/*
DROP TABLE REWARDS;
CREATE TABLE rewards
  (employee_id    NUMBER(6) NOT NULL,
   pay_raise NUMBER(8,2),
   payraise_date DATE NOT NULL
   )
/

insert into rewards
  values(103, 10000, TO_DATE('13-AUG-2002', 'DD-MON-YYYY'));
insert into rewards
  values(141, 2500,TO_DATE( '07-DEC-2007', 'DD-MON-YYYY'));
insert into rewards
  values(201, 4875, TO_DATE( '27-NOV-2008', 'DD-MON-YYYY'));
insert into rewards
  values(206, 1800, TO_DATE( '10-NOV-2006', 'DD-MON-YYYY'));
 
COMMIT;

SELECT last_name, salary from empl6
WHERE  empl6.employee_id 
IN     (SELECT employee_id FROM rewards);
UPDATE empl6
SET    salary = (SELECT empl6.salary + rewards.pay_raise
                 FROM   rewards
                 WHERE  employee_id  =  
                        empl6.employee_id
                 AND  payraise_date = 
                      (SELECT MAX(payraise_date) 
                      FROM   rewards
                      WHERE  employee_id = empl6.employee_id))
WHERE  empl6.employee_id 
IN     (SELECT employee_id FROM rewards);

commit;

SELECT last_name, salary from empl6
WHERE  empl6.employee_id 
IN     (SELECT employee_id FROM rewards);



*/ 

--Uncomment code below to run the code for slide 16_sa for lesson 7
/*
DROP TABLE emp_history;
CREATE TABLE emp_history
  (employee_id    NUMBER(6) NOT NULL,
   resignation_date DATE)
   
/

insert into emp_history
  values(102, TO_DATE('13-AUG-2002', 'DD-MON-YYYY'));
insert into emp_history
  values(103,TO_DATE( '07-DEC-2007', 'DD-MON-YYYY'));
insert into emp_history
  values(106, TO_DATE( '27-NOV-2008', 'DD-MON-YYYY'));
insert into emp_history
  values(107, TO_DATE( '10-NOV-2006', 'DD-MON-YYYY'));
 
COMMIT;


DELETE FROM empl6 E
WHERE employee_id =  
           (SELECT employee_id
            FROM   emp_history 
            WHERE  employee_id = E.employee_id);
*/
