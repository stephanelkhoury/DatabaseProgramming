-- Lab: Database Administration

-- Step 1: Transactions and Concurrency Control
-- Task: Demonstrate a transaction with rollback and commit.

-- Create a sample table for inventory
CREATE TABLE Inventory (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    ItemName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL
);

-- Insert sample data
INSERT INTO Inventory (ItemName, Quantity) VALUES ('Laptop', 10), ('Mouse', 50);

-- Start a transaction
START TRANSACTION;

-- Update inventory
UPDATE Inventory SET Quantity = Quantity - 2 WHERE ItemName = 'Laptop';

-- Simulate a rollback
ROLLBACK;

-- Verify rollback
SELECT * FROM Inventory;

-- Start another transaction
START TRANSACTION;

-- Update inventory
UPDATE Inventory SET Quantity = Quantity - 2 WHERE ItemName = 'Laptop';

-- Commit the transaction
COMMIT;

-- Verify commit
SELECT * FROM Inventory;

-- Step 2: Locking and Deadlocks
-- Task: Simulate a deadlock scenario.

-- Open two sessions and execute the following commands:

-- Session 1
START TRANSACTION;
UPDATE Inventory SET Quantity = Quantity - 1 WHERE ItemName = 'Laptop';

-- Session 2
START TRANSACTION;
UPDATE Inventory SET Quantity = Quantity - 1 WHERE ItemName = 'Mouse';

-- Session 1
UPDATE Inventory SET Quantity = Quantity - 1 WHERE ItemName = 'Mouse';

-- Session 2
UPDATE Inventory SET Quantity = Quantity - 1 WHERE ItemName = 'Laptop';

-- Observe the deadlock and resolve it by rolling back one of the transactions.

-- Step 3: Database Security
-- Task: Create roles and assign permissions.

-- Create a role for inventory managers
CREATE ROLE InventoryManager;

-- Grant permissions to the role
GRANT SELECT, UPDATE ON Inventory TO InventoryManager;

-- Create a user and assign the role
CREATE USER 'manager'@'localhost' IDENTIFIED BY 'password';
GRANT InventoryManager TO 'manager'@'localhost';

-- Verify permissions
SHOW GRANTS FOR 'manager'@'localhost';

-- Step 4: Backup and Recovery
-- Task: Simulate a backup and recovery process.

-- Create a backup of the Inventory table
SELECT * FROM Inventory INTO OUTFILE '/tmp/inventory_backup.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- Simulate data loss
DELETE FROM Inventory;

-- Verify data loss
SELECT * FROM Inventory;

-- Restore data from the backup
LOAD DATA INFILE '/tmp/inventory_backup.csv' INTO TABLE Inventory
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- Verify restoration
SELECT * FROM Inventory;

-- Step 5: Cursors
-- Task: Use a cursor to process rows one by one.

-- Create a stored procedure to process inventory
DELIMITER //
CREATE PROCEDURE ProcessInventory()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE itemName VARCHAR(100);
    DECLARE itemQuantity INT;
    DECLARE cur CURSOR FOR SELECT ItemName, Quantity FROM Inventory;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO itemName, itemQuantity;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Process each row (e.g., print to console or log)
        SELECT CONCAT('Processing item: ', itemName, ' with quantity: ', itemQuantity);
    END LOOP;

    CLOSE cur;
END;
//
DELIMITER ;

-- Call the procedure
CALL ProcessInventory();

-- Step 6: Distributed Databases
-- Task: Simulate a partitioned database setup.

-- Create two tables to simulate partitioning
CREATE TABLE Inventory_Part1 (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL
);

CREATE TABLE Inventory_Part2 (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL
);

-- Insert data into partitions
INSERT INTO Inventory_Part1 (ItemID, ItemName, Quantity) VALUES (1, 'Laptop', 10);
INSERT INTO Inventory_Part2 (ItemID, ItemName, Quantity) VALUES (2, 'Mouse', 50);

-- Query data from both partitions
SELECT * FROM Inventory_Part1;
SELECT * FROM Inventory_Part2;

-- Step 7: Object-Oriented Databases
-- Task: Create a table with user-defined types.

-- Create a user-defined type for address
CREATE TYPE Address AS (
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10)
);

-- Create a table using the Address type
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address Address
);

-- Insert data into the table
INSERT INTO Customer (Name, Address) VALUES ('John Doe', ROW('123 Elm St', 'New York', 'NY', '12345'));

-- Query the table
SELECT * FROM Customer;

-- End of Lab
