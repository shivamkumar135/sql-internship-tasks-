
--Task : Queries and Joins
-- 1. GROUP BY with an Aggregate function
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS total_spent
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, 
    c.customer_name;

-- 2. Join across tables (Inner Join, Left Join, and Right Join)
SELECT 
    o.order_id,
    c.customer_name,
    p.product_name,
    oi.quantity
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
LEFT JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id;