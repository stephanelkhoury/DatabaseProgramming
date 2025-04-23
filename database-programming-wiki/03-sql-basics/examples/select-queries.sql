-- Example 1: Select all columns from the Customers table
SELECT * FROM Customers;

-- Example 2: Select specific columns from the Orders table
SELECT Order_ID, Product_Name, Product_Price FROM Orders;

-- Example 3: Select customers with a specific condition (e.g., name is 'Alice')
SELECT * FROM Customers WHERE Name = 'Alice';

-- Example 4: Select products with a price greater than a certain amount
SELECT * FROM Orders WHERE Product_Price > 100;

-- Example 5: Select customers and their orders using JOIN
SELECT c.Name, o.Product_Name, o.Product_Price 
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID;

-- Example 6: Select distinct product names from the Orders table
SELECT DISTINCT Product_Name FROM Orders;

-- Example 7: Select customers and count their orders
SELECT c.Name, COUNT(o.Order_ID) AS Order_Count
FROM Customers c
LEFT JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name;