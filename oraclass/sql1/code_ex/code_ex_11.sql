
--The SQL Script to run the code_examples for Lesson 11


-- Uncomment code below to run the code for slide 08_sa for lesson 11

/* 
          DROP TABLE dept;
          CREATE TABLE dept       (deptno      NUMBER(2), dname       VARCHAR2(14),  loc         VARCHAR2(13),
          create_date DATE DEFAULT SYSDATE);

*/

-- Uncomment code below to run the code for slide 08_sb for lesson 11

/*
         DESCRIBE dept

*/

-- Uncomment code below to run the code for slide 13_sa for lesson 11
/*
          DROP TABLE hire_dates;
          CREATE TABLE hire_dates
           (id  NUMBER(8),
           hire_date DATE DEFAULT SYSDATE);

*/

-- Uncomment code below to run the code for slide 13_na for lesson 11

/*

          INSERT INTO hire_dates values(45, NULL);
*/

-- Uncomment code below to run the code for slide 13_nb for lesson 11

/*

          INSERT INTO hire_dates(id) values(35);
*/



-- Uncomment code below to run the code for slide 27_sa for lesson 11

/*
          DROP TABLE  teach_emp;
          CREATE TABLE teach_emp (empno      NUMBER(5) PRIMARY KEY, ename      VARCHAR2(15) NOT NULL, job        VARCHAR2(10),
                                                                   mgr        NUMBER(5), hiredate   DATE DEFAULT (sysdate), 
                                                                  photo      BLOB, sal        NUMBER(7,2), deptno     NUMBER(3) NOT NULL
                     CONSTRAINT admin_dept_fkey REFERENCES
                      departments(department_id));
*/
 

-- Uncomment code below to run the code for slide 28_sa for lesson 11

/*
         UPDATE employees
         SET    department_id = 55
         WHERE  department_id = 110;
*/

-- Uncomment code below to run the code for slide 29_sa for lesson 11

/*
         DELETE FROM departments
         WHERE department_id = 60;
*/

-- Uncomment code below to run the code for slide 29_na for lesson 11

/*
        DELETE FROM  departments
        WHERE department_id = 70;
*/

-- Uncomment code below to run the code for slide 32_sa for lesson 11
--Please ignore the warning message, if you get any.

/*
        CREATE TABLE dept80
        AS   SELECT  employee_id, last_name,  salary*12 ANNSAL, 
         hire_date   FROM    employees WHERE   department_id = 80;


-- Uncomment code below to run the code for slide 32_sb for lesson 11

/*
         DESCRIBE dept80

*/

-- Uncomment code below to run the code for slide 32_na for lesson 11

/*
        CREATE TABLE dept80
        AS   SELECT  employee_id, last_name,  salary*12, 
         hire_date   FROM    employees WHERE   department_id = 80;
*/
-- Uncomment code below to run the code for slide 36_sa for lesson 11

/*
         ALTER TABLE dept80
        ADD (job_id VARCHAR2(9));

         select * from dept80;
*/

-- Uncomment code below to run the code for slide 37_sa for lesson 11
/*
          ALTER TABLE dept80
          MODIFY(last_name VARCHAR2(30));

          DESCRIBE dept80
*/

-- Uncomment code below to run the code for slide 38_sa for lesson 11

/*
         ALTER TABLE  dept80
         DROP (job_id);

         select * from dept80;
*/

-- Uncomment code below to run the code for slide 39_na for lesson 11

/*
            ALTER TABLE dept80 
             SET UNUSED(hire_date)ONLINE;
             select * from dept80;

-- Uncomment code below to run the code for slide 40_na for lesson 11
/*
          ALTER TABLE  dept80
          SET   UNUSED (last_name);

          select * from dept80;

*/

-- Uncomment code below to run the code for slide 40_nb for lesson 11
/*
         ALTER TABLE  dept80
         DROP  UNUSED COLUMNS;

        
*/

-- Uncomment code below to run the code for slide 43_sa for lesson 11
/*
           DROP TABLE dept80;
*/
