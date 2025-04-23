-- This SQL file demonstrates the issues with using lists for data storage, showcasing redundancy, update anomalies, and deletion anomalies through example queries.

-- Example of a list storing customer orders
-- This structure can lead to redundancy and anomalies

CREATE TABLE CustomerOrders (
    CustomerName VARCHAR(50),
    OrderID INT,
    ProductName VARCHAR(50),
    ProductPrice DECIMAL(10, 2)
);

-- Inserting sample data into the CustomerOrders table
INSERT INTO CustomerOrders (CustomerName, OrderID, ProductName, ProductPrice) VALUES
('Alice', 101, 'Laptop', 1200),
('Alice', 102, 'Mouse', 20),
('Bob', 103, 'Laptop', 1200);

-- Query to demonstrate redundancy
SELECT * FROM CustomerOrders;

-- Update anomaly example: Changing the price of Laptop
UPDATE CustomerOrders SET ProductPrice = 1300 WHERE ProductName = 'Laptop';

-- Query to show the effect of the update anomaly
SELECT * FROM CustomerOrders;

-- Deletion anomaly example: Deleting Bob's order
DELETE FROM CustomerOrders WHERE CustomerName = 'Bob';

-- Query to show the effect of the deletion anomaly
SELECT * FROM CustomerOrders;