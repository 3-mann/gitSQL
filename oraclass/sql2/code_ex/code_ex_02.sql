--The SQL Script to run the code_examples for Lesson 2

--Uncomment code below to run the code for slide 7_sa for lesson 2


/* DESCRIBE dictionary


--Uncomment code below to run the code for slide 7_sb for lesson 2
/*

SELECT *
FROM   dictionary
WHERE  table_name = 'USER_OBJECTS';
*/

--Uncomment code below to run the code for slide 7_na for lesson 2

/* 
SELECT table_name
FROM dictionary
WHERE LOWER(comments) LIKE '%columns%';
*/

--Uncomment code below to run the code for slide 9_sa for lesson 2

/* 
SELECT object_name, object_type, created, status
FROM   user_objects
ORDER BY object_type;

*/

--Uncomment code below to run the code for slide 11_sa for lesson 2

/* DESCRIBE user_tables

--Uncomment code below to run the code for slide 11_sb for lesson 2

/*
SELECT table_name
FROM   user_tables;
*/


--Uncomment code below to run the code for slide 12_sa for lesson 2

/* DESCRIBE user_tab_columns

--Uncomment code below to run the code for slide 13_sa for lesson 2

/* 
SELECT column_name, data_type, data_length,
       data_precision, data_scale, nullable
FROM   user_tab_columns
WHERE  table_name = 'EMPLOYEES'; 
*/

--Uncomment code below to run the code for slide 14_sa for lesson 2

/* DESCRIBE user_constraints

--Uncomment code below to run the code for slide 15_sa for lesson 2

/* 
SELECT constraint_name, constraint_type,
       search_condition, r_constraint_name, 
       delete_rule, status
FROM   user_constraints
WHERE  table_name = 'EMPLOYEES'; 
*/

--Uncomment code below to run the code for slide 16_sa for lesson 2

/* DESCRIBE user_cons_columns

--Uncomment code below to run the code for slide 16_sb for lesson 2


/* 
SELECT constraint_name, column_name
FROM   user_cons_columns
WHERE  table_name = 'EMPLOYEES'; 
*/



--Uncomment code below to run the code for slide 18_sa for lesson 2
/*
COMMENT ON TABLE employees
IS 'Employee Information';
*/

--Uncomment code below to run the code for slide 18_sb for lesson 2
/*
COMMENT ON COLUMN employees.first_name
IS 'First name of the Employee';
*/


--Uncomment code below to run the code for slide 18_na for lesson 2

/* COMMENT ON TABLE  employees IS ' ';
