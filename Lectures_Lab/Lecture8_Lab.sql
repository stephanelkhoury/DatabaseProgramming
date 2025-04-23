-- Lab: Big Data, Data Warehousing, and Business Intelligence Systems

-- Step 1: Human Intuition vs. Data-Driven Decisions
-- Task: Calculate fuel savings for Bubba and Daisy.

-- Create a table for fuel efficiency data
CREATE TABLE FuelEfficiency (
    Person VARCHAR(50),
    InitialMPG DECIMAL(5, 2),
    FinalMPG DECIMAL(5, 2),
    MilesDriven INT
);

-- Insert sample data
INSERT INTO FuelEfficiency (Person, InitialMPG, FinalMPG, MilesDriven)
VALUES 
('Bubba', 10, 12, 2000),
('Daisy', 30, 50, 2000);

-- Query to calculate fuel savings
SELECT 
    Person,
    (MilesDriven / InitialMPG - MilesDriven / FinalMPG) AS GallonsSaved
FROM FuelEfficiency;

-- Step 2: Business Intelligence (BI) Systems
-- Task: Create a table for BI reporting and data mining.

CREATE TABLE SalesData (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    SaleDate DATE,
    QuantitySold INT,
    Revenue DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO SalesData (ProductName, SaleDate, QuantitySold, Revenue)
VALUES 
('Laptop', '2023-01-01', 5, 6000.00),
('Mouse', '2023-01-02', 20, 500.00),
('Keyboard', '2023-01-03', 15, 675.00);

-- Query for BI reporting
SELECT ProductName, SUM(Revenue) AS TotalRevenue
FROM SalesData
GROUP BY ProductName;

-- Step 3: Data Warehouse & ETL
-- Task: Simulate the ETL process.

-- Create a staging table for raw data
CREATE TABLE RawSalesData (
    ProductName VARCHAR(100),
    SaleDate VARCHAR(50),
    QuantitySold VARCHAR(50),
    Revenue VARCHAR(50)
);

-- Insert raw data
INSERT INTO RawSalesData (ProductName, SaleDate, QuantitySold, Revenue)
VALUES 
('Laptop', '2023-01-01', '5', '6000.00'),
('Mouse', '2023-01-02', '20', '500.00');

-- Transform and load data into the warehouse
INSERT INTO SalesData (ProductName, SaleDate, QuantitySold, Revenue)
SELECT 
    ProductName,
    STR_TO_DATE(SaleDate, '%Y-%m-%d'),
    CAST(QuantitySold AS INT),
    CAST(Revenue AS DECIMAL(10, 2))
FROM RawSalesData;

-- Step 4: Star Schema
-- Task: Create a star schema for a sales data warehouse.

CREATE TABLE FactSales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    TimeID INT,
    CustomerID INT,
    QuantitySold INT,
    Revenue DECIMAL(10, 2)
);

CREATE TABLE DimProduct (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

CREATE TABLE DimTime (
    TimeID INT PRIMARY KEY AUTO_INCREMENT,
    SaleDate DATE,
    Month VARCHAR(20),
    Year INT
);

CREATE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Region VARCHAR(50)
);

-- Insert sample data into dimensions
INSERT INTO DimProduct (ProductName, Category) VALUES ('Laptop', 'Electronics'), ('Mouse', 'Electronics');
INSERT INTO DimTime (SaleDate, Month, Year) VALUES ('2023-01-01', 'January', 2023);
INSERT INTO DimCustomer (CustomerName, Region) VALUES ('John Doe', 'North America');

-- Insert sample data into fact table
INSERT INTO FactSales (ProductID, TimeID, CustomerID, QuantitySold, Revenue)
VALUES (1, 1, 1, 5, 6000.00);

-- Query to analyze sales by product and region
SELECT 
    dp.ProductName,
    dc.Region,
    SUM(fs.Revenue) AS TotalRevenue
FROM FactSales fs
JOIN DimProduct dp ON fs.ProductID = dp.ProductID
JOIN DimCustomer dc ON fs.CustomerID = dc.CustomerID
GROUP BY dp.ProductName, dc.Region;

-- Step 5: OLAP Cube
-- Task: Create an OLAP cube simulation.

-- Query to slice data by product and month
SELECT 
    dp.ProductName,
    dt.Month,
    SUM(fs.Revenue) AS TotalRevenue
FROM FactSales fs
JOIN DimProduct dp ON fs.ProductID = dp.ProductID
JOIN DimTime dt ON fs.TimeID = dt.TimeID
GROUP BY dp.ProductName, dt.Month;

-- Step 6: Data Mining Techniques
-- Task: Perform clustering and regression simulations.

-- Clustering: Group products by category
SELECT Category, COUNT(*) AS ProductCount
FROM DimProduct
GROUP BY Category;

-- Regression: Predict revenue based on quantity sold
SELECT 
    QuantitySold,
    AVG(Revenue / QuantitySold) AS AvgRevenuePerUnit
FROM FactSales
GROUP BY QuantitySold;

-- Step 7: NoSQL and MapReduce
-- Task: Simulate a MapReduce process.

-- Create a table for text message data
CREATE TABLE TextMessages (
    MessageID INT PRIMARY KEY AUTO_INCREMENT,
    Sender VARCHAR(50),
    Receiver VARCHAR(50),
    MessageText TEXT
);

-- Insert sample data
INSERT INTO TextMessages (Sender, Receiver, MessageText)
VALUES 
('Alice', 'Bob', 'Hello Bob!'),
('Bob', 'Alice', 'Hi Alice!'),
('Alice', 'Charlie', 'Hey Charlie!');

-- Map: Count messages sent by each user
SELECT Sender, COUNT(*) AS MessageCount
FROM TextMessages
GROUP BY Sender;

-- Reduce: Aggregate total messages
SELECT SUM(MessageCount) AS TotalMessages
FROM (
    SELECT Sender, COUNT(*) AS MessageCount
    FROM TextMessages
    GROUP BY Sender
) AS MessageCounts;

-- End of Lab
