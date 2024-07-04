USE magist;

/* What categories of tech products does Magist have? */ 

SELECT * 
	FROM products;
    
SELECT p.product_category_name, pcnt.product_category_name_english, COUNT(p.product_id) AS product_count
FROM 
products p
LEFT JOIN 
product_category_name_translation pcnt ON p.product_category_name = pcnt.product_category_name
GROUP BY 
pcnt.product_category_name_english,
p.product_category_name
ORDER BY 
product_count DESC;



SELECT p.product_category_name, pcnt.product_category_name_english, COUNT(p.product_id)
	FROM products p
		LEFT JOIN product_category_name_translation pcnt ON p.product_category_name = pcnt.product_category_name
        LEFT JOIN order_items oi ON p.product_id = oi.product_id
			WHERE product_category_name_english LIKE 'industry%'
				OR product_category_name_english LIKE '%commerce'
				OR product_category_name_english LIKE 'tablets%'
				OR product_category_name_english LIKE '%appliance'
				OR product_category_name_english LIKE '%print%'
				OR product_category_name_english LIKE '%tools'
				OR product_category_name_english LIKE 'office%'
				OR product_category_name_english LIKE 'computers%'
				OR product_category_name_english LIKE 'dvds%'
                OR product_category_name_english LIKE 'office%'
                OR product_category_name_english LIKE 'market%'
				OR product_category_name_english IN ('audio', 'music', 'computers', 'telephony', 'electronics', 'pc_gamers')
                GROUP BY product_category_name;
                
                
                
                
                
                
                
                
                
                
                
                