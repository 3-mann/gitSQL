set SERVEROUTPUT on;
DECLARE
  v_fname VARCHAR2(10 CHAR) := 'Dieter';
BEGIN
DBMS_OUTPUT.PUT_LINE('The first Name of the employee is ' || v_fname);
END;

REM   Script: DReimann_Part_01
REM   This code is just meant for repeating the lessons learned.

create table DEPARTMENTS (   
  deptno        number,   
  name          varchar2(50) not null,   
  location      varchar2(50),   
  constraint pk_departments primary key (deptno)   
);

create table DEPARTMENTS (   
  deptno        number,   
  name          varchar2(50) not null,   
  location      varchar2(50),   
  constraint pk_departments primary key (deptno)   
);

create table EMPLOYEES (   
  empno             number,   
  name              varchar2(50) not null,   
  job               varchar2(50),   
  manager           number,   
  hiredate          date,   
  salary            number(7,2),   
  commission        number(7,2),   
  deptno           number,   
  constraint pk_employees primary key (empno),   
  constraint fk_employees_deptno foreign key (deptno)  
      references DEPARTMENTS (deptno)   
);

grant sys_guid to hr;


create or replace trigger  DEPARTMENTS_BIU 
    before insert or update on DEPARTMENTS 
    for each row 
begin 
    if inserting and :new.deptno is null then 
        :new.deptno := to_number(sys_guid(),  
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'); 
    end if; 
end; 
/

create or replace trigger EMPLOYEES_BIU 
    before insert or update on EMPLOYEES 
    for each row 
begin 
    if inserting and :new.empno is null then 
        :new.empno := to_number(sys_guid(),  
            'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'); 
    end if; 
end; 
/

desc utl_file;
create or replace directory pumpe as 'C:\app\gitSQL\Pumpe';
GRANT WRITE ON directory pumpe TO ora21 ;
GRANT READ ON DIRECTORY pumpe TO hr ;

set serveroutput on;
var b_x varchar2(50);
exec my_proc_01 (:b_x);
