-- Lab: Performance Optimization

-- Step 1: Create a sample table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    SaleDate DATE,
    QuantitySold INT,
    Revenue DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO Sales (ProductName, SaleDate, QuantitySold, Revenue)
VALUES 
('Laptop', '2023-01-01', 5, 6000.00),
('Mouse', '2023-01-02', 20, 500.00),
('Keyboard', '2023-01-03', 15, 675.00);

-- Step 2: Create indexes
CREATE INDEX idx_productname ON Sales (ProductName);
CREATE INDEX idx_saledate ON Sales (SaleDate);

-- Step 3: Query optimization
-- Query without index
EXPLAIN SELECT * FROM Sales WHERE ProductName = 'Laptop';

-- Query with index
EXPLAIN SELECT * FROM Sales WHERE SaleDate = '2023-01-01';

-- Step 4: Optimize joins
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductName VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data
INSERT INTO Customers (Name) VALUES ('Alice'), ('Bob');
INSERT INTO Orders (CustomerID, ProductName) VALUES (1, 'Laptop'), (2, 'Mouse');

-- Query with join optimization
EXPLAIN SELECT c.Name, o.ProductName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Step 5: Aggregate optimization
-- Query with aggregate function
SELECT ProductName, SUM(Revenue) AS TotalRevenue
FROM Sales
GROUP BY ProductName;

-- End of Lab
