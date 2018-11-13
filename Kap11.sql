CREATE TABLE dep1(
    dep_id   NUMBER       CONSTRAINT dep1_dep_id PRIMARY KEY,
    dep_name VARCHAR2(30) CONSTRAINT dep1_dep_name_nn NOT NULL 
                          CONSTRAINT dep1_dep_name_uk UNIQUE,
    man_id   NUMBER,
    loc_id   NUMBER       CONSTRAINT dep1_loc_id_fk REFERENCES locations(location_id)
);

CREATE TABLE emp1(
    emp_id   NUMBER,
    emp_name VARCHAR2(30) NOT NULL,
    email    VARCHAR2(60),
    salary   NUMBER,
    dep_id   NUMBER,
    CONSTRAINT emp1_dep_id_fk FOREIGN KEY(dep_id) REFERENCES dep1(dep_id),
    CONSTRAINT emp1_email_uk  UNIQUE(email),
    CONSTRAINT emp1_emp_id_pk PRIMARY KEY(emp_id),
    CONSTRAINT emp1_salary_ck CHECK(salary > 0)
);

INSERT INTO dep1
SELECT * FROM departments;

INSERT INTO emp1 
SELECT employee_id, last_name, email, salary, department_id 
FROM employees 
WHERE employee_id = 100;

COMMIT;

SELECT * FROM dep1;
SELECT * FROM emp1;

INSERT INTO emp1 VALUES(100, NULL, 'SKING', 0, 900);
--ORA-01400: Einfügen von NULL in ("ORA1"."EMP1"."EMP_NAME") nicht möglich
INSERT INTO emp1 VALUES(100, 'Name', 'SKING', 0, 900);
--ORA-02290: CHECK-Constraint (ORA1.EMP1_SALARY_CK) verletzt
INSERT INTO emp1 VALUES(100, 'Name', 'SKING', 10000, 900);
--ORA-00001: Unique Constraint (ORA1.EMP1_EMP_ID_PK) verletzt
INSERT INTO emp1 VALUES(1000, 'Name', 'SKING', 10000, 900);
--ORA-00001: Unique Constraint (ORA1.EMP1_EMAIL_UK) verletzt
INSERT INTO emp1 VALUES(1000, 'Name', NULL, 10000, 900);
--ORA-02291: Integritäts-Constraint (ORA1.EMP1_DEP_ID_FK) verletzt - übergeordneter Schlüssel nicht gefunden
INSERT INTO emp1 VALUES(1000, 'Name', NULL, 10000, 90);
-- 1 Zeile eingefügt

DELETE FROM dep1;
--ORA-02292: Integritäts-Constraint (ORA1.EMP1_DEP_ID_FK) verletzt - untergeordneter Datensatz gefunden

CREATE TABLE new_employees AS
    SELECT employee_id emp_id,
           first_name || ' ' || last_name emp_name,
           salary,
           salary * 12 ann_salary,
           hire_date,
           department_id dep_id
    FROM   employees
    WHERE  department_id = 90;

SELECT * FROM new_employees;
DESC new_employees;

CREATE TABLE emp2 AS
    SELECT employee_id, last_name, salary, department_id
    FROM   employees;

DESC emp2;

ALTER TABLE emp2 ADD email NUMBER;
ALTER TABLE emp2 ADD (
    job_id VARCHAR2(30),
    manager_id NUMBER DEFAULT 100
);
DESC emp2;
SELECT * FROM emp2;

ALTER TABLE emp2 MODIFY email VARCHAR2(60);
ALTER TABLE emp2 MODIFY last_name VARCHAR2(5);
--ORA-01441: Spaltenlänge kann nicht vermindert werden, weil ein Wert zu groß ist
SELECT MAX(LENGTH(last_name)) FROM emp2; -- 9
ALTER TABLE emp2 MODIFY last_name VARCHAR2(9);
ALTER TABLE emp2 MODIFY last_name VARCHAR2(90);
ALTER TABLE emp2 MODIFY job_id DEFAULT 'IT_PROG';
SELECT * FROM emp2;

ALTER TABLE emp2 DROP COLUMN salary;
ALTER TABLE emp2 DROP (department_id, job_id);
DESC emp2;

ALTER TABLE emp2 SET UNUSED(email, manager_id);
DESC emp2;

SELECT * FROM user_unused_col_tabs;

ALTER TABLE emp2 DROP UNUSED COLUMNS;

ALTER TABLE emp2 RENAME COLUMN last_name TO lname;
DESC emp2;
ALTER TABLE emp2 RENAME TO emp222;
DESC emp222;

DROP TABLE new_employees;
DROP TABLE emp222;

SHOW RECYCLEBIN;

SELECT * FROM new_employees;
--ORA-00942: Tabelle oder View nicht vorhanden
FLASHBACK TABLE new_employees TO BEFORE DROP;
SHOW RECYCLEBIN;

SELECT * FROM new_employees;
PURGE RECYCLEBIN;
DROP TABLE new_employees PURGE;

