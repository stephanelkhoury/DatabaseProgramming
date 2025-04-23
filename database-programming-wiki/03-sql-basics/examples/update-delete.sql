-- Update example: Changing the phone number of a customer
UPDATE Customers 
SET Phone = '555-987654' 
WHERE Name = 'Alice';

-- Delete example: Removing a customer from the database
DELETE FROM Customers 
WHERE Name = 'Charlie';