SELECT prod_category,avg(prod_list_price) 
FROM products
GROUP BY prod_category 
    HAVING avg(prod_list_price) < ALL 
        (SELECT max(prod_list_price)/2 
        FROM products 
        GROUP BY prod_category
        );

SELECT prod_category,avg(prod_list_price) 
FROM products 
GROUP BY prod_category 
    HAVING avg(prod_list_price) > ANY 
        (SELECT max(prod_list_price)/2 
        FROM products GROUP BY prod_category
        ); 

SELECT prod_category,avg(prod_list_price) 
FROM products HAVING avg(prod_list_price) < ALL     
    (SELECT max(prod_list_price)/2 
    FROM products GROUP BY prod_category
    );

SELECT prod_category,avg(prod_list_price) 
FROM products GROUP BY prod_category HAVING avg(prod_list_price) > ANY 
    (SELECT max(prod_list_price)/2 FROM products
    );
-- the missing Solution
SELECT prod_category,round(avg(prod_list_price),2) Lowest_Group_Price 
FROM products GROUP BY prod_category HAVING avg(prod_list_price) < ANY 
    (SELECT max(prod_list_price)/2 FROM products
    );
