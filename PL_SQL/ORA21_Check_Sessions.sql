SELECT username, sid, serial#, program, sql_id, machine, terminal,

osuser FROM v$session

WHERE username IS NOT NULL; 

/

ALTER SYSTEM KILL SESSION '140,32406'; 
'SID,SERIAL#'