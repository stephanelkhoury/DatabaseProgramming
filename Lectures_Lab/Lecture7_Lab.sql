-- Lab: Database Indexing

-- Step 1: Create a Sample Table
-- Task: Create a table to demonstrate indexing.

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);

-- Insert sample data
INSERT INTO Products (ProductName, Category, Price, Stock) VALUES
('Laptop', 'Electronics', 1200.00, 50),
('Mouse', 'Electronics', 25.00, 200),
('Keyboard', 'Electronics', 45.00, 150),
('Desk', 'Furniture', 300.00, 20),
('Chair', 'Furniture', 150.00, 30),
('Notebook', 'Stationery', 5.00, 500),
('Pen', 'Stationery', 1.50, 1000);

-- Step 2: Create Indexes
-- Task: Create clustered and nonclustered indexes.

-- Create a clustered index on the primary key (ProductID)
ALTER TABLE Products ADD PRIMARY KEY (ProductID);

-- Create a nonclustered index on the Category column
CREATE INDEX idx_category ON Products (Category);

-- Create a nonclustered index on the Price column
CREATE INDEX idx_price ON Products (Price);

-- Step 3: Query Performance with Indexes
-- Task: Compare query performance with and without indexes.

-- Query without using an index (full table scan)
SELECT * FROM Products WHERE Category = 'Electronics';

-- Query using the nonclustered index on Category
EXPLAIN SELECT * FROM Products WHERE Category = 'Electronics';

-- Query using the nonclustered index on Price
EXPLAIN SELECT * FROM Products WHERE Price > 100;

-- Step 4: Bitmap Index Simulation
-- Task: Simulate a bitmap index for low-cardinality data.

-- Create a table for low-cardinality data
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    Status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL
);

-- Insert sample data
INSERT INTO Orders (ProductID, Status) VALUES
(1, 'Pending'),
(2, 'Shipped'),
(3, 'Delivered'),
(4, 'Cancelled'),
(5, 'Pending'),
(6, 'Shipped'),
(7, 'Delivered');

-- Query to count orders by status
SELECT Status, COUNT(*) AS OrderCount
FROM Orders
GROUP BY Status;

-- Step 5: Hashed Index Simulation
-- Task: Simulate a hashed index for distributed systems.

-- Create a table for hashed index simulation
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- Insert sample data
INSERT INTO Users (Username, Email) VALUES
('john_doe', 'john@example.com'),
('jane_doe', 'jane@example.com'),
('alice', 'alice@example.com'),
('bob', 'bob@example.com');

-- Simulate a hashed index by querying with a hash function
SELECT * FROM Users WHERE MD5(Username) = MD5('john_doe');

-- Step 6: Design Considerations
-- Task: Create indexes based on query patterns.

-- Create an index on frequently queried columns
CREATE INDEX idx_stock ON Products (Stock);

-- Query to find products with low stock
SELECT * FROM Products WHERE Stock < 50;

-- Step 7: Best Practices
-- Task: Demonstrate indexing on high-cardinality and low-cardinality columns.

-- High-cardinality column: Price
CREATE INDEX idx_high_cardinality ON Products (Price);

-- Low-cardinality column: Category
CREATE INDEX idx_low_cardinality ON Products (Category);

-- Query to demonstrate high-cardinality index
SELECT * FROM Products WHERE Price > 1000;

-- Query to demonstrate low-cardinality index
SELECT * FROM Products WHERE Category = 'Furniture';

-- Step 8: Drop Indexes
-- Task: Drop an index and observe performance impact.

-- Drop the index on Category
DROP INDEX idx_category ON Products;

-- Query without the index
EXPLAIN SELECT * FROM Products WHERE Category = 'Furniture';

-- End of Lab
