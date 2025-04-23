-- Lab: Testing and Debugging

-- Step 1: Testing Queries
-- Task: Write test cases for CRUD operations.

-- Create a sample table for testing
CREATE TABLE TestTable (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 0)
);

-- Insert sample data
INSERT INTO TestTable (Name, Age) VALUES ('Alice', 30), ('Bob', 25);

-- Test case: Validate data retrieval
SELECT * FROM TestTable WHERE Name = 'Alice';

-- Test case: Validate data update
UPDATE TestTable SET Age = 35 WHERE Name = 'Alice';
SELECT * FROM TestTable WHERE Name = 'Alice';

-- Test case: Validate data deletion
DELETE FROM TestTable WHERE Name = 'Bob';
SELECT * FROM TestTable;

-- Step 2: Debugging Deadlocks
-- Task: Simulate and resolve a deadlock scenario.

-- Create a sample table for deadlock simulation
CREATE TABLE DeadlockTable (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Value INT NOT NULL
);

-- Insert sample data
INSERT INTO DeadlockTable (Value) VALUES (100), (200);

-- Simulate a deadlock (requires two sessions):
-- Session 1:
START TRANSACTION;
UPDATE DeadlockTable SET Value = Value - 10 WHERE ID = 1;

-- Session 2:
START TRANSACTION;
UPDATE DeadlockTable SET Value = Value - 20 WHERE ID = 2;

-- Session 1:
UPDATE DeadlockTable SET Value = Value - 10 WHERE ID = 2;

-- Session 2:
UPDATE DeadlockTable SET Value = Value - 20 WHERE ID = 1;

-- Resolve the deadlock by rolling back one of the transactions:
-- Session 1 or Session 2:
ROLLBACK;

-- Step 3: Debugging Constraint Violations
-- Task: Handle primary key, foreign key, and check constraint violations.

-- Create a parent table
CREATE TABLE ParentTable (
    ParentID INT PRIMARY KEY,
    ParentName VARCHAR(100) NOT NULL
);

-- Create a child table with a foreign key constraint
CREATE TABLE ChildTable (
    ChildID INT PRIMARY KEY,
    ParentID INT,
    ChildName VARCHAR(100) NOT NULL,
    FOREIGN KEY (ParentID) REFERENCES ParentTable(ParentID)
);

-- Insert valid data
INSERT INTO ParentTable (ParentID, ParentName) VALUES (1, 'Parent1');
INSERT INTO ChildTable (ChildID, ParentID, ChildName) VALUES (1, 1, 'Child1');

-- Attempt to insert invalid data (violates foreign key constraint)
-- Uncommenting the following line will result in an error
-- INSERT INTO ChildTable (ChildID, ParentID, ChildName) VALUES (2, 999, 'Child2');

-- Attempt to insert invalid data (violates check constraint)
-- Uncommenting the following line will result in an error
-- INSERT INTO TestTable (Name, Age) VALUES ('Invalid', -5);

-- End of Lab
