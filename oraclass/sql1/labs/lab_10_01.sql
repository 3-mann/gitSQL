DROP TABLE my_employee;
CREATE TABLE my_employee
  (id  NUMBER(4) CONSTRAINT my_employee_id_pk PRIMARY Key,
   last_name VARCHAR2(25),
   first_name VARCHAR2(25),
   userid  VARCHAR2(8),
   salary  NUMBER(9,2));
