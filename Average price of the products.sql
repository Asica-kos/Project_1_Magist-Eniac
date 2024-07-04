SELECT * 
FROM order_items;

SELECT product_id, ROUND(AVG(price),2) AS avg_price 
FROM 
order_items
GROUP BY 
product_id
ORDER BY 
ROUND(AVG(price),2) DESC;

SELECT ROUND(AVG(price),2) AS avg_price 
FROM order_items;