CREATE DATABASE retail_analytics;
USE retail_analytics;
CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
region VARCHAR(50));
INSERT INTO customers VALUES 
(1, 'Amit Sharma', 'North'),
(2, 'Neha Verma', 'West'),
(3, 'Rahul Singh', 'South'),
(4, 'Priya Mehta', 'East'),
(5, 'Ankit Jain', 'North'),
(6, 'Sneha Kapoor', 'West'),
(7, 'Vikas Rao', 'South'),
(8, 'Pooja Nair', 'East'),
(9, 'Rohit Malhotra' ,'North'),
(10, 'Kavya Iyer', 'South'),
(11, 'Arjun Patel', 'West'),
(12, 'Meenal Gupta', 'East');
SELECT COUNT(*)FROM CUSTOMERS;

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50));
INSERT INTO products VALUES
(101, 'Office Chair', 'Furniture'),
(102, 'Laptop Stand', 'Technology'),
(103, 'Wireless Mouse', 'Technology'),
(104, 'Notebook', 'Stationery'),
(105, 'Desk Lamp', 'Furniture'),
(106, 'Pen Set', 'Stationery'),
(107, 'Monitor Stand', 'Technology'),
(108, 'Table Organizer', 'Furniture');
SELECT*FROM products;

CREATE TABLE orders(
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,
product_id INT,
quantity INT,
sales DECIMAL(10,2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id));
INSERT INTO orders VALUES
(1001, '2024-10-03', 1, 101, 2, 5000),
(1002, '2024-10-06', 2, 102, 1, 2500),
(1003, '2024-10-09', 3, 103, 3, 4500),
(1004, '2024-10-12', 4, 104, 8, 1600),
(1005, '2024-10-15', 5, 105, 1, 1800),
(1006, '2024-10-18', 6, 106, 5, 750),
(1007, '2024-10-21', 7, 107, 2, 6000),
(1008, '2024-10-25', 8, 108, 1, 1200),
(1009, '2024-11-02', 1, 103, 2, 3000),
(1010, '2024-11-05', 9, 101, 1, 2500),
(1011, '2024-11-08', 10, 102, 1, 2500),
(1012, '2024-11-11', 11, 104, 10, 2000),
(1013, '2024-11-15', 12, 105, 2, 3600),
(1014, '2024-11-18', 2, 106, 6, 900),
(1015, '2024-11-22', 3, 107, 1, 3000),
(1016, '2024-12-03', 4, 101, 1, 2500),
(1017, '2024-12-07', 5, 102, 2, 5000),
(1018, '2024-12-10', 6, 103, 3, 4500),
(1019, '2024-12-14', 7, 104, 12, 2400),
(1020, '2024-12-18', 8, 105, 1, 1800),
(1021, '2024-12-22', 9, 106, 4, 600),
(1022, '2025-01-04', 10, 107, 2, 6000),
(1023, '2025-01-07', 11, 108, 1, 1200),
(1024, '2025-01-10', 12, 101, 1, 2500),
(1025, '2025-01-14', 1, 102, 1, 2500),
(1026, '2025-01-18', 2, 103, 2, 3000),
(1027, '2025-01-22', 3, 104, 8, 1600),
(1028, '2025-01-26', 4, 105, 2, 3600),
(1029, '2025-01-29', 5, 106, 6, 900),
(1030, '2025-02-02', 6, 101, 1, 2500);
SELECT *FROM orders;

SELECT SUM(sales) AS total_revenue FROM orders;
SELECT 
YEAR(order_date) AS year,
MONTH(order_date) AS month,
SUM(sales) AS monthly_revenue
FROM orders GROUP BY YEAR(order_date),MONTH(order_date)
ORDER BY year, month;

SELECT product_name, SUM(sales) AS total_revenue
FROM orders
JOIN products
ON orders.product_id= products.product_id
GROUP BY product_name;

 SELECT customer_name, SUM(sales) AS customer_revenue
 FROM orders
 JOIN customers
 ON customers.customer_id= orders.customer_id
 GROUP BY customer_name;

SELECT 
SUM(sales)/COUNT(order_id)
AS avg_order_value
FROM orders;
SELECT*FROM customers;




