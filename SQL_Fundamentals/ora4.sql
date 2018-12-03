--A       Korrekt
    select min(salary), max(salary)  
        from (select salary from employees
        where hire_date < sysdate -365)
        ;
--B       
    select minsal, maxsal from  
         (select min(salary) minsal, max(salary) maxsal
            from employees
            where hire_date < sysdate -365)
            GROUP BY min(salary), max(salary)
        ;

--C    Korrekt
select minsal, maxsal from 
    (select min(salary) minsal, max(salary) maxsal 
        from employees
        where hire_date < sysdate -365)
        group by minsal, maxsal;
--D    
    select min(salary) minsal, max(salary) maxsal  
        from employees
        where hire_date < sysdate -365
        group by min(salary), max(salary);
