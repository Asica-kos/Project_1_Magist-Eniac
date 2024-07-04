--- 1

select avg (timestampdiff(day, order_purchase_timestamp, order_delivered_customer_date))
from orders;

---- 2

select (timestampdiff (day, order_delivered_customer_date, order_estimated_delivery_date)),
 order_delivered_customer_date, order_estimated_delivery_date, order_status
from orders
where order_status = 'delivered';

---- 3

select avg (product_length_cm), avg (product_height_cm), avg (product_width_cm)
from orders
join order_items as o on orders.order_id = o.order_id
join products as p on o.product_id = p.product_id
where (timestampdiff (day, order_delivered_customer_date, order_estimated_delivery_date)) > 0;




