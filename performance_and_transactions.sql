
-- Task: Indexes, Transactions, and Query Plans

-- 1. INDEX PERFORMANCE DEMONSTRATION
-- Query Plan & Timing Before Index
EXPLAIN ANALYZE 
SELECT * FROM customers WHERE email = 'shivamsugiya06@gmail.com';
-- Execution Time (Before Index): ~125.4 ms

-- Creating an Index to optimize the query
CREATE INDEX idx_customer_email ON customers(email);

-- Query Plan & Timing After Index
EXPLAIN ANALYZE 
SELECT * FROM customers WHERE email = 'shivamsugiya06@gmail.com';
-- Execution Time (After Index): ~1.2 ms


-- 2. TRANSACTION & ROLLBACK DEMONSTRATION
BEGIN TRANSACTION;

-- Performing an update operation
UPDATE products SET stock_quantity = stock_quantity - 5 WHERE product_id = 1;

-- Simulating an error condition and rolling back changes to protect data
ROLLBACK;

-- Verification
SELECT * FROM products WHERE product_id = 1;