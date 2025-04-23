-- Capstone Project: E-Commerce Database

-- Step 1: Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Step 2: Insert Data
INSERT INTO Customers (Name, Email) VALUES ('Alice', 'alice@example.com'), ('Bob', 'bob@example.com');
INSERT INTO Products (ProductName, Price) VALUES ('Laptop', 1200.00), ('Mouse', 25.00);
INSERT INTO Orders (CustomerID, OrderDate) VALUES (1, '2023-01-01'), (2, '2023-01-02');
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (1, 1, 1), (2, 2, 2);

-- Step 3: Query Data
-- Query to retrieve customer orders
SELECT c.Name, p.ProductName, od.Quantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

-- End of Lab
