select deptno, listagg(ename,',') within group (order by ename) emplist 
from emp 
group by deptno ;
/
--Syntax noch später genau zu besprechen, hier nur ON OVERFLOW wichtig
SELECT deptno, 
LISTAGG(ename, ',' ON OVERFLOW TRUNCATE '~~~') WITHIN GROUP (ORDER BY ename) AS employees 
FROM emp 
CROSS JOIN (SELECT level FROM dual CONNECT BY level <= 1000) 
WHERE deptno = 30 
GROUP BY deptno 
ORDER BY deptno;


SELECT * FROM emp ;

SELECT * FROM dept ;

SELECT e.ename AS "Name des Angestellen", d.loc arbeitsort, e.deptno, d.deptno FROM emp e ,dept d
WHERE e.deptno=d.deptno ; 
