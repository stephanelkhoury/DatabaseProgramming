CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_Name VARCHAR(100),
    Product_Price DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

INSERT INTO Customers (Customer_ID, Name, Phone) VALUES (1, 'Alice', '123-456789');
INSERT INTO Customers (Customer_ID, Name, Phone) VALUES (2, 'Bob', '987-654321');

INSERT INTO Orders (Order_ID, Customer_ID, Product_Name, Product_Price) VALUES (101, 1, 'Laptop', 1200);
INSERT INTO Orders (Order_ID, Customer_ID, Product_Name, Product_Price) VALUES (102, 1, 'Mouse', 20);
INSERT INTO Orders (Order_ID, Customer_ID, Product_Name, Product_Price) VALUES (103, 2, 'Laptop', 1200);