DROP USER bernd ;
CREATE USER bernd IDENTIFIED BY brot ;

GRANT CREATE SESSION TO bernd ;

GRANT CREATE TABLE TO bernd ;

GRANT CREATE VIEW TO bernd ;

GRANT SELECT ON ora1.departments TO bernd ;

SELECT name, value FROM v$parameter WHERE name LIKE '%segment%' ;

ALTER USER bernd QUOTA 2M ON users ;

ALTER USER bernd QUOTA 0M ON users ;

ALTER USER bernd QUOTA UNLIMITED ON users ;

REVOKE SELECT ON ora1.departments FROM bernd ;

SELECT * FROM dba_sys_privs ;

desc dba_sys_privs 

SELECT PRIVILEGE, ADMIN_OPTION FROM dba_sys_privs 
WHERE grantee='BERND' ;

desc dba_tab_privs 

SELECT grantee, owner, table_name, grantor, privilege FROM dba_tab_privs 
WHERE grantee IN ('BERND','ORA1','ORA21', 'SCOTT')
ORDER BY 1 ;

GRANT SELECT ON scott.dept TO ora1, ora21 ;

DROP ROLE buchhalter ;
CREATE ROLE buchhalter ;

GRANT SELECT ON ora1.employees TO buchhalter ;
GRANT UPDATE  (salary) ON ora1.employees TO buchhalter ;
GRANT SELECT  ON scott.emp TO buchhalter ;, 
GRANT UPDATE  (sal) ON  scott.emp TO buchhalter ;

SELECT * FROM role_tab_privs WHERE role='BUCHHALTER' ;

GRANT buchhalter TO bernd ;

REVOKE buchhalter FROM bernd ;

GRANT CREATE SEQUENCE TO buchhalter ;

SELECT * FROM role_sys_privs WHERE role='BUCHHALTER' ;

SELECT * FROM role_role_privs WHERE role='BUCHHALTER' ;

GRANT DBA TO buchhalter ;

ALTER USER bernd IDENTIFIED BY broetchen PASSWORD EXPIRE ;

DROP USER bernd CASCADE ;

ALTER USER bernd ACCOUNT LOCK ;

ALTER USER bernd ACCOUNT UNLOCK ;

REVOKE CREATE SESSION FROM bernd ;

CREATE USER enterprise IDENTIFIED BY enterprise ;
GRANT CREATE TABLE TO enterprise ;

CREATE TABLE ....
GRANT SELECT ON table... TO spock 

brücke  hat EXP_ANY_TABLE 
spock bracut IMP_ANY_TABLE 


CREATE TABLE ...copy AS SELECT * FROM ...
