-- This SQL file provides examples of using subqueries to perform complex queries.

-- Example 1: Subquery in SELECT statement
SELECT Name, 
       (SELECT COUNT(*) 
        FROM Orders 
        WHERE Orders.Customer_ID = Customers.Customer_ID) AS OrderCount
FROM Customers;

-- Example 2: Subquery in WHERE clause
SELECT Name 
FROM Customers 
WHERE Customer_ID IN (SELECT Customer_ID 
                       FROM Orders 
                       WHERE Product_Name = 'Laptop');

-- Example 3: Subquery with EXISTS
SELECT Name 
FROM Customers c 
WHERE EXISTS (SELECT * 
              FROM Orders o 
              WHERE o.Customer_ID = c.Customer_ID 
              AND o.Product_Price > 1000);

-- Example 4: Correlated subquery
SELECT Name, 
       (SELECT AVG(Product_Price) 
        FROM Orders o 
        WHERE o.Customer_ID = c.Customer_ID) AS AvgOrderPrice
FROM Customers c;