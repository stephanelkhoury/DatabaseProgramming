-- This SQL file illustrates how data is organized in relational tables, including examples of customer and order tables and how they relate to each other.

-- Customers Table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15)
);

-- Orders Table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_Name VARCHAR(100),
    Product_Price DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

-- Inserting sample data into Customers table
INSERT INTO Customers (Customer_ID, Name, Phone) VALUES
(1, 'Alice', '123-456789'),
(2, 'Bob', '987-654321');

-- Inserting sample data into Orders table
INSERT INTO Orders (Order_ID, Customer_ID, Product_Name, Product_Price) VALUES
(101, 1, 'Laptop', 1200.00),
(102, 1, 'Mouse', 20.00),
(103, 2, 'Laptop', 1200.00);

-- Example of a JOIN query to retrieve customer names and their orders
SELECT c.Name, o.Product_Name, o.Product_Price 
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID;