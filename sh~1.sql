SELECT p.promo_id, p.promo_name, s.prod_id
FROM sales s RIGHT OUTER JOIN promotions p
ON (s.promo_id = p.promo_id);