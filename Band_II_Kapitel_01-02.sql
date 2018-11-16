-- USE ORA1

select      TABLE_NAME 
        ,   COMMENTS  
from dictionary;
select * from dict_columns where table_name = 'USER_TABLES';

select * from dict where table_name like 'USER%';

select * from user_views;

select * from user_tables;

select * from dict_columns where table_name = 'USER_TABLES';

select * from dict where table_name = 'USER_TABLES';

select * from user_select * from dict_columns where table_name = 'USER_TABLES';
tab_columns where table_name = 'EMPLOYEES';select * from dict_columns where table_name = 'USER_TABLES';

select * from dict where table_name like'USER%PRIV%';

select * from user_objects order by object_type;

--create sequence fibonacci start with 2 increment;

CREATE SEQUENCE s1;

CREATE SEQUENCE s2
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 100
    CYCLE
    NOCACHE; 
    
    

select s1.nextval s1, s2.nextval s2 from dual;

select s1.currval s1, s2.currval s2 from dual;

create sequence seq1;
create table test_seq(
    id number default seq1.nextval,
    text varchar2(100)
);

insert into test_seq values(1,'T');
insert into test_seq(text) values('T1');
insert into test_seq(text) values('T2');
insert into test_seq(text) values('T3');
insert into test_seq values(NULL,'T4');
insert into test_seq values(DEFAULT,'T5');
drop sequence seq1;
select * from test_seq;

drop table test_seq;

CREATE TABLE test_seq(
    id NUMBER GENERATED ALWAYS AS IDENTITY
    (
        START WITH 10
        INCREMENT BY 10
        MAXVALUE 50
    ),
    text VARCHAR2(100)
); 

select * from user_tab_columns where table_name ='TEST_SEQ';
select * from user_sequences;

insert into test_seq values(1,'T');
insert into test_seq(text) values('T1');
insert into test_seq(text) values('T2');
insert into test_seq(text) values('T3');
insert into test_seq values(NULL,'T4');
insert into test_seq values(DEFAULT,'T5');
drop sequence seq1;
select * from test_seq;


drop table test_seq purge;

CREATE TABLE test_seq(
    id NUMBER GENERATED by default AS IDENTITY
    (
        START WITH 10
        INCREMENT BY 10
    ) unique,
    text VARCHAR2(100)
);

drop table test_seq purge;

CREATE TABLE test_seq(
    id NUMBER GENERATED by default on null AS IDENTITY
    (
        START WITH 10
        INCREMENT BY 10
    ) unique,
    text VARCHAR2(100)
);

drop table test_seq purge;

CREATE TABLE test_seq(
    id raw(16) GENERATED by default on null AS IDENTITY
    (
        select sys_guid() from dual
    ) primary key,
    text VARCHAR2(100)
);


insert into test_seq values(1,'T');
insert into test_seq(text) values('T1');
insert into test_seq(text) values('T2');
insert into test_seq(text) values('T3');
insert into test_seq values(NULL,'T4');
insert into test_seq values(DEFAULT,'T5');
select * from test_seq;



create synonym e for employees;
create synonym j for jobs;
create synonym d for departments;
create synonym r for regions;
create synonym c for countries;

create table big_table as select * from all_objects;

select count(*) from big_Table;

select * from big_Table;

create index big_table_obj_name_idx on big_table(object_name);
create index big_table_obj_name_idx2 on big_table(lower(object_name));
create bitmap index big_table_obj_name_idx1 on big_table(object_name);


drop index big_table_obj_name_idx;
commit;

analyze table big_table compute statistics;

select * from big_table where object_name = 'EMPLOYEES';

drop table big_table purge;


