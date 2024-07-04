/* Are expensive tech products popular? */


SELECT * 
FROM order_items;


SELECT 
p.product_category_name,
pcnt.product_category_name_english,
ROUND(AVG(oi.price),2) AS avg_price,
CASE WHEN price <= 100 THEN 'cheap_product'
	 WHEN price > 100 <= 500 THEN 'moderate_expensive_product'
     ELSE 'expensive_product'
     END AS price_category
FROM
    products p
LEFT JOIN
    product_category_name_translation pcnt ON p.product_category_name = pcnt.product_category_name
LEFT JOIN
    order_items oi ON p.product_id = oi.product_id
LEFT JOIN
    orders o ON oi.order_id = o.order_id
WHERE
    product_category_name_english LIKE 'industry%' OR
    product_category_name_english LIKE '%commerce' OR
    product_category_name_english LIKE '%tools' OR
    product_category_name_english LIKE 'tablets%' OR
    product_category_name_english LIKE '%appliance' OR
    product_category_name_english LIKE '%print%' OR
    product_category_name_english LIKE 'office%' OR
    product_category_name_english LIKE 'computers%' OR
    product_category_name_english LIKE 'dvds%' OR
    product_category_name_english LIKE 'market%' OR
    product_category_name_english IN ('audio', 'music', 'computers', 'telephony', 'electronics', 'pc_gamers')
GROUP BY
    p.product_category_name,
    pcnt.product_category_name_english,
    price_category
ORDER BY 
    price_category DESC;