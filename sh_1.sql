SELECT prod_id FROM costs
WHERE promo_id IN (SELECT promo_id FROM promotions
WHERE promo_cost < All
(SELECT MAX(promo_cost) FROM promotions
GROUP BY (promo_end_date, promo_begin_date)));

SELECT promo_end_date, promo_begin_date, MAX(promo_cost) 
    FROM promotions
    GROUP BY (promo_end_date, promo_begin_date);

--########################### 51 #######################

SELECT promo_category
FROM promotions
MINUS
SELECT promo_category
FROM promotions
WHERE promo_subcategory = 'discount';

SELECT promo_category
FROM promotions
INTERSECT
SELECT promo_category
FROM promotions
WHERE promo_subcategory = 'discount';

SELECT promo_category
FROM promotions
MINUS
SELECT promo_category FROM promotions
WHERE promo_subcategory <> 'discount';

SELECT promo_category
FROM promotions
INTERSECT
SELECT promo_category
FROM promotions
WHERE promo_subcategory <> 'discount';


--######################################################

SELECT TO_DATE ('2016-02-12', 'YYYY-MM-DD')
SELECT TO_DATE ('2016.02.12', 'YYYY.MM.DD')
SELECT TO_DATE ('02-2016-12', 'MM-YYYY-DD')

 FROM DUAL; 
 