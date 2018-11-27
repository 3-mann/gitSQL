select * from user_sequences;

create table department_copy as select * from departments where 1 = 0;

select * from department_copy;


INSERT INTO department_copy (
    department_id
    , department_name
    , manager_id
    , location_id
) Select 
    department_id
    , department_name
    , manager_id
    , location_id 
    from departments 
    where department_id > 40;
    
    
 UPDATE department_copy
   SET
    manager_id = 205
 WHERE
    department_id     = :welcheDeptID
;   

select * from department_copy;

 UPDATE department_copy
   SET
    department_id = :neueAbteilung
 WHERE
    department_id     = :alteAbteilung
;

commit;

delete from department_copy;

INSERT INTO department_copy (
    department_id
    , department_name
    , manager_id
    , location_id
) Select 
    department_id
    , department_name
    , manager_id
    , location_id 
    from departments 
    where mod(department_id,10) = 0;


 UPDATE department_copy
   SET
    manager_id = NULL
 WHERE
    department_id = :alteAbteilung
;

SELECT * FROM employees;

 UPDATE department_copy
   SET manager_id = 100
 WHERE mod(department_id,20 ) = 0 
;
 UPDATE department_copy
   SET manager_id = 200
 WHERE mod(department_id,20 ) != 0 
;

rollback;

 UPDATE employees
    SET employee_id = (select job_id from employees where employee_id = 205),
        salary      = (select salary from employees where employee_id = 205)
 WHERE employee_id = 103
;

drop table emp_copy;
create table emp_copy as select * from employees;

alter table emp_copy add dname varchar2(30);


select * from emp_copy;

UPDATE emp_copy e
    SET e.dname  = (select department_id from departments d where d.department_id = e.department_id)
;

delete from emp_copy where manager_id = NULL and last_name <> 'Grant';

UPDATE emp_copy e
    SET e.dname  = (select department_id from departments d where d.department_id = e.department_id)
;

commit;

DELETE FROM emp_copy a  WHERE   a.rowid >   ANY (
    SELECT  b.rowid     FROM    emp_copy b  WHERE   a.last_name = b.last_name
        AND a.first_name = b.first_name ); 
        
        
        
        
        
