
-- Task  Capstone: Complete Application Database Setup

-- 1. SCHEMA CREATION
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE user_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 2. SEED DATA (Aap yahan apni email ID daal sakte hain)
INSERT INTO users (username, email) VALUES 
('shivam_kumar', 'shivam@example.com'),
('rahul_sharma', 'rahul@example.com');

INSERT INTO items (item_name, price, stock) VALUES 
('Laptop', 75000.00, 10),
('Wireless Mouse', 1200.00, 50);

INSERT INTO user_orders (user_id, total_price) VALUES 
(1, 76200.00);

-- 3. VIEWS FOR REPORTING
CREATE VIEW vw_user_order_summary AS
SELECT 
    u.user_id,
    u.username,
    o.order_id,
    o.total_price,
    o.order_date
FROM users u
JOIN user_orders o ON u.user_id = o.user_id;

-- 4. BACKUP AND RESTORE DOCUMENTATION (Stored as SQL comments)
-- To Backup Database via Command Line:
-- mysqldump -u root -p app_database > backup.sql

-- To Restore Database via Command Line:
-- mysql -u root -p app_database < backup.sql