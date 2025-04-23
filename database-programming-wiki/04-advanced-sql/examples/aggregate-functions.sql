-- This SQL file demonstrates the use of aggregate functions like COUNT, SUM, AVG, etc.

-- Example 1: Count the number of customers
SELECT COUNT(*) AS Total_Customers
FROM Customers;

-- Example 2: Calculate the total sales amount
SELECT SUM(Product_Price) AS Total_Sales
FROM Orders;

-- Example 3: Calculate the average product price
SELECT AVG(Product_Price) AS Average_Product_Price
FROM Orders;

-- Example 4: Count the number of orders per customer
SELECT Customer_ID, COUNT(Order_ID) AS Number_of_Orders
FROM Orders
GROUP BY Customer_ID;

-- Example 5: Find the maximum and minimum product prices
SELECT MAX(Product_Price) AS Max_Product_Price, MIN(Product_Price) AS Min_Product_Price
FROM Orders;

-- Example 6: Calculate total sales per product
SELECT Product_Name, SUM(Product_Price) AS Total_Sales
FROM Orders
GROUP BY Product_Name;