SELECT HIRE_DATE, CASE
WHEN  TRIM(TO_CHAR(HIRE_DATE,'DAY')) IN ('SATURDAY','SUNDAY') THEN 'weekend'
ELSE 'weekday'		END "Day Type"     FROM employees;

SELECT HIRE_DATE, TO_CHAR(HIRE_DATE,'DAY'), CASE
WHEN  TO_CHAR(HIRE_DATE,'DAY') BETWEEN 'MONTAG' AND 'FREITAG' THEN 'weekday'
ELSE 'weekend'	END  "Day Type"     FROM employees;

SELECT customer_id, cust_last_name, credit_limit, nls_territory
    FROM customers
    WHERE credit_limit IN (
        select credit_limit
        FROM customers
        WHERE nls_territory ='GERMANY'
        )
    
;

select customer_id, cust_first_name, cust_last_name, credit_limit from customers;
update customers set credit_limit = NULL where customer_id = '233';

--##################################### Frage 49 ##############
SELECT category_id, avg(list_price), max(list_price)/2  
    FROM product_information
    GROUP BY category_id 
        HAVING avg(list_price) < ALL (SELECT max(list_price)/2 
                                            FROM product_information 
                                            GROUP BY category_id);

--#### Aufgabe 49 ###############
SELECT category_id, round(avg(list_price),2) "_AVG", max(list_price)/2 "_MAX" 
    FROM product_information 
    GROUP BY category_id 
        HAVING(avg(list_price) < max(list_price)/2)     
    order by max(list_price)/2
;
--#### Ende ################ 
                                            
                                            
SELECT category_id,round(avg(list_price),2) "_AVG", max(list_price)/2 "_MAX" 
    FROM product_information 
    GROUP BY category_id 
        HAVING avg(list_price) > ANY (SELECT max(list_price)/2 
                                      FROM product_information 
                                      GROUP BY category_id); 
                                      
SELECT category_id, avg(list_price) 
    FROM product_information 
    HAVING avg(list_price) < ALL (SELECT max(list_price)/2 
                                  FROM product_information 
                                  GROUP BY category_id)    
    --GROUP BY category_id       -- so wäre es zumindest executable
;


SELECT category_id,avg(list_price), max(list_price)/2  
    FROM product_information 
        GROUP BY category_id 
        HAVING avg(list_price) > ANY (
            SELECT max(list_price)/2 
            FROM product_information);

--#############################################################


