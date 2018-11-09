use ora1;
Insert into departments (   department_name, department_id, manager_id, location_id)
            values      (   'IT', 100, 200, 1700);
            
Rollback; 

--####### Drag&Drop Statements mit Eingabemaske ###############
INSERT INTO job_history (
    employee_id
    , start_date
    , end_date
    , job_id
    , department_id
) VALUES (
    :Emp_ID
    , :HireDtae
    , :DropDate
    , :JobID
    , :DeptID
);

--####### Drag&Drop modifizieren ################
INSERT INTO employees (
    employee_id
    , first_name
    , last_name
    , email
    , phone_number
    , hire_date
    , job_id
    , salary
    , commission_pct
    , manager_id
    , department_id
) VALUES (
    employees_seq.nextval
    , :Vorname
    , :Nachname
    , :eMail-Prefix
    , '049-170-12346'
    , to_date('09-NOV.18 12:40','DD-MON-RR hh24:mi')
    , 'SA_REP'
    , 3700
    , 0.5
    , (select manager_id from departments where department_name = 'Sales')
    , (select department_id from departments where department_name = 'Sales')
);
            
    