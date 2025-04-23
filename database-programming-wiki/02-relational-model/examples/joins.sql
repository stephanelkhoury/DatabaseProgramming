SELECT c.Name, o.Product_Name, o.Product_Price 
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID; 

SELECT o.Order_ID, c.Name, o.Product_Name, o.Product_Price 
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
WHERE o.Product_Price > 100;

SELECT c.Name, COUNT(o.Order_ID) AS Total_Orders 
FROM Customers c
LEFT JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name;

SELECT c.Name, o.Product_Name 
FROM Customers c
RIGHT JOIN Orders o ON c.Customer_ID = o.Customer_ID; 

SELECT c.Name, o.Product_Name 
FROM Customers c
FULL OUTER JOIN Orders o ON c.Customer_ID = o.Customer_ID;