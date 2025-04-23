-- This SQL file provides examples of enforcing integrity constraints in a database.

-- Example of creating a table with primary key constraint
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15)
);

-- Example of creating a table with foreign key constraint
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_Name VARCHAR(100) NOT NULL,
    Product_Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

-- Example of creating a table with unique constraint
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) UNIQUE NOT NULL,
    Product_Price DECIMAL(10, 2) NOT NULL
);

-- Example of creating a table with check constraint
CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Product_ID INT,
    Quantity INT CHECK (Quantity >= 0),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- Example of inserting data that violates integrity constraints
-- Uncommenting the following line will result in an error due to foreign key constraint
-- INSERT INTO Orders (Order_ID, Customer_ID, Product_Name, Product_Price) VALUES (1, 999, 'Laptop', 1200);

-- Example of inserting valid data
INSERT INTO Customers (Customer_ID, Name, Phone) VALUES (1, 'Alice', '123-456789');
INSERT INTO Products (Product_ID, Product_Name, Product_Price) VALUES (1, 'Laptop', 1200);
INSERT INTO Orders (Order_ID, Customer_ID, Product_Name, Product_Price) VALUES (1, 1, 'Laptop', 1200);