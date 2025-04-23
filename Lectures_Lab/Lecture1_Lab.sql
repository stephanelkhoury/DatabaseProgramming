-- Lab: Introduction to Databases

-- Step 1: Create Tables
-- Task: Create tables to represent Customers and Orders.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    ProductPrice DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Step 2: Insert Data
-- Task: Populate the tables with sample data.

INSERT INTO Customers (Name, Phone) VALUES
('Alice', '123-456789'),
('Bob', '987-654321');

INSERT INTO Orders (CustomerID, ProductName, ProductPrice) VALUES
(1, 'Laptop', 1200.00),
(1, 'Mouse', 20.00),
(2, 'Laptop', 1200.00);

-- Step 3: Query Data
-- Task: Write queries to demonstrate CRUD operations.

-- a) Create: Add a new customer and their order.
INSERT INTO Customers (Name, Phone) VALUES ('Charlie', '555-123456');
INSERT INTO Orders (CustomerID, ProductName, ProductPrice) VALUES (3, 'Keyboard', 45.00);

-- b) Read: Retrieve all orders along with customer names.
SELECT c.Name, o.ProductName, o.ProductPrice
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- c) Update: Change the phone number for Bob.
UPDATE Customers SET Phone = '555-654321' WHERE Name = 'Bob';

-- d) Delete: Remove Charlie and their order.
DELETE FROM Orders WHERE CustomerID = 3;
DELETE FROM Customers WHERE CustomerID = 3;

-- Step 4: Addressing Anomalies
-- Task: Demonstrate how relational databases solve redundancy and anomalies.

-- Query to show normalized data (no redundancy):
SELECT c.Name, o.ProductName, o.ProductPrice
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Step 5: Summary
-- Task: Review the benefits of relational databases.

-- Query to demonstrate data integrity:
-- Ensure that deleting a customer also removes their orders.
DELETE FROM Customers WHERE CustomerID = 2;

-- Verify cascading delete:
SELECT * FROM Orders WHERE CustomerID = 2;

-- End of Lab
