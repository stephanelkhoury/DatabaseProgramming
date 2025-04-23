-- Lab: Database Design

-- Step 1: Create Tables for Normalization Example
-- Task: Normalize the given Customer table into three tables: Customer, Zip, and Accountant.

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL,
    AccountantID INT NOT NULL
);

CREATE TABLE Zip (
    ZipCode VARCHAR(10) PRIMARY KEY,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(50) NOT NULL
);

CREATE TABLE Accountant (
    AccountantID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL
);

-- Insert sample data into normalized tables
INSERT INTO Zip (ZipCode, City, State) VALUES
('12345', 'New York', 'NY'),
('67890', 'Los Angeles', 'CA');

INSERT INTO Accountant (Name, Phone) VALUES
('Alice', '555-1234'),
('Bob', '555-5678');

INSERT INTO Customer (Name, Address, ZipCode, AccountantID) VALUES
('John Doe', '123 Elm St', '12345', 1),
('Jane Smith', '456 Oak St', '67890', 2);

-- Step 2: Denormalization Example
-- Task: Create a denormalized version of the Customer table.

CREATE TABLE DenormalizedCustomer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(50) NOT NULL,
    AccountantName VARCHAR(100) NOT NULL,
    AccountantPhone VARCHAR(15) NOT NULL
);

-- Insert data into the denormalized table
INSERT INTO DenormalizedCustomer (Name, Address, City, State, AccountantName, AccountantPhone)
VALUES
('John Doe', '123 Elm St', 'New York', 'NY', 'Alice', '555-1234'),
('Jane Smith', '456 Oak St', 'Los Angeles', 'CA', 'Bob', '555-5678');

-- Step 3: Representing Relationships
-- Task: Create tables for 1:1, 1:N, and N:M relationships.

-- 1:1 Relationship Example: Player and Locker
CREATE TABLE Locker (
    LockerID INT PRIMARY KEY AUTO_INCREMENT,
    LockerNumber VARCHAR(10) NOT NULL,
    PlayerID INT UNIQUE,
    CONSTRAINT FK_Player FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
);

CREATE TABLE Player (
    PlayerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL
);

-- Insert sample data
INSERT INTO Player (Name) VALUES ('John'), ('Jane');
INSERT INTO Locker (LockerNumber, PlayerID) VALUES ('L001', 1), ('L002', 2);

-- 1:N Relationship Example: Team and Player
CREATE TABLE Team (
    TeamID INT PRIMARY KEY AUTO_INCREMENT,
    TeamName VARCHAR(100) NOT NULL
);

ALTER TABLE Player ADD TeamID INT;
ALTER TABLE Player ADD CONSTRAINT FK_Team FOREIGN KEY (TeamID) REFERENCES Team(TeamID);

-- Insert sample data
INSERT INTO Team (TeamName) VALUES ('Team A'), ('Team B');
UPDATE Player SET TeamID = 1 WHERE PlayerID = 1;
UPDATE Player SET TeamID = 2 WHERE PlayerID = 2;

-- N:M Relationship Example: Student and Class
CREATE TABLE Class (
    ClassID INT PRIMARY KEY AUTO_INCREMENT,
    ClassName VARCHAR(100) NOT NULL
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE StudentClass (
    StudentID INT,
    ClassID INT,
    PRIMARY KEY (StudentID, ClassID),
    CONSTRAINT FK_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    CONSTRAINT FK_Class FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

-- Insert sample data
INSERT INTO Class (ClassName) VALUES ('Math'), ('Science');
INSERT INTO Student (Name) VALUES ('Alice'), ('Bob');
INSERT INTO StudentClass (StudentID, ClassID) VALUES (1, 1), (1, 2), (2, 1);

-- Step 4: Recursive Relationships
-- Task: Create a table to represent a recursive relationship for employees and managers.

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    ManagerID INT,
    CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);

-- Insert sample data
INSERT INTO Employee (Name, ManagerID) VALUES ('Alice', NULL), ('Bob', 1), ('Carol', 1), ('Dave', 2);

-- Query to display the manager-employee hierarchy
SELECT e1.EmployeeID, e1.Name AS Employee, e2.Name AS Manager
FROM Employee e1
LEFT JOIN Employee e2 ON e1.ManagerID = e2.EmployeeID;

-- Step 5: Queries
-- Task: Write queries to demonstrate normalization, denormalization, and relationships.

-- Query 1: Display normalized Customer data with city and state.
SELECT c.Name, c.Address, z.City, z.State, a.Name AS AccountantName, a.Phone AS AccountantPhone
FROM Customer c
JOIN Zip z ON c.ZipCode = z.ZipCode
JOIN Accountant a ON c.AccountantID = a.AccountantID;

-- Query 2: Display denormalized Customer data.
SELECT * FROM DenormalizedCustomer;

-- Query 3: Display players and their lockers.
SELECT p.Name AS Player, l.LockerNumber
FROM Player p
JOIN Locker l ON p.PlayerID = l.PlayerID;

-- Query 4: Display students and their classes.
SELECT s.Name AS Student, c.ClassName
FROM Student s
JOIN StudentClass sc ON s.StudentID = sc.StudentID
JOIN Class c ON sc.ClassID = c.ClassID;

-- Query 5: Display the manager-employee hierarchy.
SELECT e1.Name AS Employee, e2.Name AS Manager
FROM Employee e1
LEFT JOIN Employee e2 ON e1.ManagerID = e2.EmployeeID;

-- End of Lab
