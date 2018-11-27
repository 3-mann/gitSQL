SELECT distinct c1.cust_first_name, c1.cust_city
FROM Customers c1 full join Customers c2
ON (c1.cust_city=c2.cust_city AND c1.cust_first_name<>c2.cust_first_name);

desc customers;

Select country
FROM sales JOIN customers USING (cust_id)
FULL OUTER JOIN countries USING (country_id);

FROM sales JOIN customers USING (cust_id)
RIGHT OUTER JOIN countries USING (country_id);

FROM customers LEFT OUTER JOIN sales USING (cust_id)    -- dies ist die richtige Antwort
RIGHT OUTER JOIN countries USING (country_id);

FROM customers LEFT OUTER JOIN sales USING (cust_id)
LEFT OUTER JOIN countries USING (country_id);



