SELECT last_name ||' joined on '|| hire_date ||', the total compensation paid is '||
TO_CHAR(ROUND(ROUND(SYSDATE-hire_date)/365) * salary + nvl(commission_pct,0)) "COMPENSATION UNTIL DATE" FROM employees;


