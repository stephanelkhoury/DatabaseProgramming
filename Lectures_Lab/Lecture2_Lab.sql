-- Step 1: Create the Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    HireDate DATE
);

-- Step 2: Create the Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Step 3: Add a foreign key to link Employee and Department
ALTER TABLE Employee
ADD CONSTRAINT FK_Department
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

-- Step 4: Insert sample data
INSERT INTO Department (DepartmentName) VALUES ('HR'), ('IT'), ('Finance');
INSERT INTO Employee (FirstName, LastName, DepartmentID, HireDate)
VALUES 
('John', 'Smith', 1, '2020-01-15'),
('Mary', 'Johnson', 2, '2019-03-10'),
('Alice', 'Brown', 3, '2021-07-22');

-- Step 5: Query the data
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID;
