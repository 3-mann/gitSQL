--The SQL Script to run the solution for Practice 2

--Uncomment code below to run the solution for Task 1 for Practice 2

/* 

SELECT table_name
   FROM   user_tables;

*/

--Uncomment code below to run the solution for Task 2 for Practice 2 
     
/* 
SELECT table_name, owner
  FROM   all_tables
  WHERE  owner <>'ORAxx';
   
*/

--Uncomment code below to run the solution for Task 3 for Practice 2

/*
SELECT column_name, data_type, data_length,
data_precision PRECISION, data_scale SCALE, nullable
FROM   user_tab_columns
WHERE  table_name = UPPER('&tab_name');
   
*/

--Uncomment code below to run the solution for Task 4 for Practice 2


/* 
SELECT ucc.column_name, uc.constraint_name, uc.constraint_type,   
       uc.search_condition, uc.status
FROM   user_constraints uc JOIN user_cons_columns ucc
ON     uc.table_name = ucc.table_name
AND    uc.constraint_name = ucc.constraint_name
AND    uc.table_name = UPPER('&tab_name'); 

*/

--Uncomment code below to run the solution for Task 5 for Practice 2
/*

COMMENT ON TABLE departments IS 
  'Company department information including name, code, and location.';

SELECT COMMENTS 
FROM   user_tab_comments
WHERE  table_name = 'DEPARTMENTS';

*/

--Uncomment code below to run the solution for Task 7 for Practice 2

/*
SELECT   table_name
FROM     user_tables
WHERE    table_name IN ('DEPT2', 'EMP2');
    
*/

--Uncomment code below to run the solution for Task 8 for Practice 2
/*     
SELECT   constraint_name, constraint_type
FROM     user_constraints
WHERE    table_name IN ('EMP2', 'DEPT2');
      
*/
--Uncomment code below to run the solution for Task 9 for Practice 2
/*
SELECT   object_name, object_type
FROM     user_objects
WHERE    object_name LIKE 'EMP2'
OR       object_name LIKE 'DEPT2';

*/

  




