-- Normalization Example: First Normal Form (1NF)
-- This example demonstrates how to convert a table into 1NF by eliminating repeating groups.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ProductName VARCHAR(100),
    ProductPrice DECIMAL(10, 2)
);

INSERT INTO Orders (OrderID, CustomerName, ProductName, ProductPrice) VALUES
(1, 'Alice', 'Laptop', 1200.00),
(2, 'Alice', 'Mouse', 20.00),
(3, 'Bob', 'Laptop', 1200.00);

-- Normalization Example: Second Normal Form (2NF)
-- This example demonstrates how to convert a table into 2NF by removing partial dependencies.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductPrice DECIMAL(10, 2)
);

CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Alice'),
(2, 'Bob');

INSERT INTO Products (ProductID, ProductName, ProductPrice) VALUES
(1, 'Laptop', 1200.00),
(2, 'Mouse', 20.00);

INSERT INTO Orders2 (OrderID, CustomerID, ProductID) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1);

-- Normalization Example: Third Normal Form (3NF)
-- This example demonstrates how to convert a table into 3NF by removing transitive dependencies.

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders2(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 1, 1);