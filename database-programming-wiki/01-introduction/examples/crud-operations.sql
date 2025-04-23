INSERT INTO Customers (Name, Phone) VALUES ('Charlie', '555-123456');

SELECT * FROM Customers WHERE Name = 'Alice';

UPDATE Customers SET Phone = '555-654321' WHERE Name = 'Bob';

DELETE FROM Customers WHERE Name = 'Charlie';