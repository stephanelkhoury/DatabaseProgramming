-- Lab: Stored Procedures and Triggers

-- Step 1: Create a stored procedure
DELIMITER //
CREATE PROCEDURE AddCustomer (IN customerName VARCHAR(100), IN customerPhone VARCHAR(15))
BEGIN
    INSERT INTO Customers (Name, Phone) VALUES (customerName, customerPhone);
END;
//
DELIMITER ;

-- Call the procedure
CALL AddCustomer('Charlie', '555-123456');

-- Step 2: Create a trigger
CREATE TRIGGER BeforeOrderInsert
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    IF NEW.ProductName = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Product name cannot be empty';
    END IF;
END;

-- Insert data to test the trigger
-- Uncommenting the following line will raise an error
-- INSERT INTO Orders (CustomerID, ProductName) VALUES (1, '');

-- Step 3: Create a function
DELIMITER //
CREATE FUNCTION CalculateTotalRevenue()
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(Revenue) INTO total FROM Sales;
    RETURN total;
END;
//
DELIMITER ;

-- Call the function
SELECT CalculateTotalRevenue();

-- End of Lab
