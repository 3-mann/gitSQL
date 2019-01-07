INSERT INTO holidays (
    holiday_id,
    holiday_date,
    holiday_weekday,
    holiday_name,
    year_valid,
    holiday_type,
    holiday_status,
    active_in
) VALUES (
    sequence_greetings.nextval,
    to_date(:Datum),
    to_Char(to_date(:Datum),'Dy'),
    :Feiertag,
    'fix',
    'ges',
    'offen',
    'Alle Bundesländer'
);
Commit
;

/*
values(sequence_greetings.nextval, to_date('01.01.2019'),'Tue','Neujahr','fix','ges','abgerufen','Alle Bundesländer');
*/

COMMIT;
        --     Status: Done    
Select * from HOLIDAYs order by holiday_date;      
        --     Status: Insert successful

delete from holidays where holiday_date = '14-jan-2019';
