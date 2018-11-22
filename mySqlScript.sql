--############Create Table####ORA Online###########

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

insert into departments (name, location) values 
   ('Finance','New York');

insert into departments (name, location) values 
   ('Development','San Jose');

select * from departments;

insert into EMPLOYEES  
   (name, job, salary, deptno)  
   values 
   ('Sam Smith','Programmer',  
    5000,  
  (select deptno  
  from departments  
  where name = 'Development'));

insert into EMPLOYEES  
   (name, job, salary, deptno)  
   values 
   ('Mara Martin','Analyst',  
   6000,  
   (select deptno  
   from departments  
   where name = 'Finance'));

insert into EMPLOYEES  
   (name, job, salary, deptno)  
   values 
   ('Yun Yates','Analyst',  
   5500,  
   (select deptno  
   from departments  
   where name = 'Development'));

select * from employees natural join departments;

select * from employees;

select * from employees;

select * from employees  join departments using(deptno);

select * from employees e, departments d where e.deptno = d.deptno;

select * from employees, departments using(deptno);

select * from employees, departments;

select table_name "Table",  
       index_name "Index",  
       column_name "Column",  
       column_position "Position" 
from  user_ind_columns  
where table_name = 'EMPLOYEES' or  
      table_name = 'DEPARTMENTS' 
order by table_name, column_name, column_position 
;

select * 
from  user_ind_columns  
where table_name = 'EMPLOYEES' or  
      table_name = 'DEPARTMENTS' 
order by table_name, column_name, column_position 
;

create index employee_dept_no_fk_idx  
on employees (deptno);

select * 
from  user_ind_columns  
where table_name = 'EMPLOYEES' or  
      table_name = 'DEPARTMENTS' 
order by table_name, column_name, column_position 
;

create unique index employee_ename_idx 
on employees (name) 
;

select * 
from  user_ind_columns  
where table_name = 'EMPLOYEES' or  
      table_name = 'DEPARTMENTS' 
order by table_name, column_name, column_position 
;

select e.name employee, 
           d.name department, 
           e.job, 
           d.location 
from departments d, employees e 
where d.deptno = e.deptno(+) 
order by e.name;

select e.name employee, 
           d.name department, 
           e.job, 
           d.location 
from departments d, employees e 
where d.deptno = e.deptno 
order by e.name;

select * from employees;

select e.name employee, 
           d.name department, 
           e.job, 
           d.location 
from departments d, employees e 
where d.deptno = e.deptno(+) 
order by e.name;

select e.name employee, 
          (select name  
           from departments d  
           where d.deptno = e.deptno) department, 
           e.job 
from employees e 
order by e.name;

select e.name employee, 
          (select name  
           from departments d  
           where d.deptno = e.deptno) department, 
           e.job, 
           d.location 
from employees e 
order by e.name;

select e.name employee, 
          (select name  
           from departments d  
           where d.deptno = e.deptno) department, 
           e.job, 
           e.location 
from employees e 
order by e.name;

alter table EMPLOYEES  
add country_code varchar2(2);

select table_name, tablespace_name, status 
from user_tables 
where table_Name = 'EMPLOYEES';

select column_id, column_name , data_type 
from user_tab_columns 
where table_Name = 'EMPLOYEES' 
order by column_id;

update employees 
set country_code = 'US';

select e.name employee, 
           d.name department, 
           e.job, 
           d.location 
from departments d, employees e 
where d.deptno = e.deptno(+) 
order by e.name;

select e.name employee, 
           d.name department, 
           e.job, 
           d.location, 
           e.country_code 
from departments d, employees e 
where d.deptno = e.deptno(+) 
order by e.name;

select e.name employee, 
           d.name department, 
           e.job, 
           d.location, 
           e.country_code, 
           e.manager, 
           e.hire_date, 
           e.salary 
from departments d, employees e 
where d.deptno = e.deptno(+) 
order by e.name;

select e.name employee, 
           d.name department, 
           e.job, 
           d.location, 
           e.country_code, 
           e.manager, 
           e.hiredate, 
           e.salary 
from departments d, employees e 
where d.deptno = e.deptno(+) 
order by e.name;
--##########End Create Table####################