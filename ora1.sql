select * from big_table where object_name = 'EMPLOYEES';

create index big_table_obj_name_idx on big_table(object_name);
create index big_table_obj_name_idx2 on big_table(lower(object_name));
create bitmap index big_table_obj_name_idx1 on big_table(object_name);


drop index big_table_obj_name_idx;
drop index big_table_obj_name_idx2;

select * from big_table where object_name = 'EMPLOYEES';
