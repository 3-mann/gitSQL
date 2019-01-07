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
Commit;
    
Select * from HOLIDAYs order by holiday_date;      

Update holidays set holiday_status = 'offen' where holiday_date = '10-jan-2019';

delete from holidays where holiday_date = '06-jan-2019';
