WITH
 dept_costs AS 
 (SELECT d.dname, SUM(e.sal) as dept_sum
                FROM emp e, dept d
                WHERE e.deptno=d.deptno 
                GROUP BY d.dname 
               )
,avg_costs  AS (
              SELECT SUM(dept_sum)/COUNT(*) AS dept_avg
                FROM dept_costs
               )
SELECT * FROM dept_costs 
   WHERE dept_sum > (SELECT dept_avg FROM avg_costs)
   ORDER BY dname
;
SELECT (8750+10875+9400)/3 dept_avg FROM dual ;


WITH
 dept_costs AS 
 (SELECT d.dname, SUM(e.sal) as dept_sum
                FROM emp e, dept d
                WHERE e.deptno=d.deptno 
                GROUP BY d.dname 
               )
,avg_costs  AS (
              SELECT SUM(dept_sum)/COUNT(*) AS dept_avg
                FROM dept_costs
               )
SELECT * FROM dept_costs 
   WHERE dept_sum > (SELECT dept_avg FROM avg_costs)
   ORDER BY dname
;

SELECT LPAD (ename , LENGTH(ename)+LEVEL*2-2,chr(011)), LEVEL ,mgr FROM emp 
CONNECT BY PRIOR empno=mgr 
START WITH ename='KING' ;


SELECT LPAD (ename , LENGTH(ename)+LEVEL*2-2,'_'), LEVEL ,mgr FROM emp 
--WHERE ename<>'JONES'
CONNECT BY PRIOR empno=mgr 
AND ename<>'JONES'
START WITH ename='KING' ;

chr(011)
SELECT ASCII(1) FROM dual ;