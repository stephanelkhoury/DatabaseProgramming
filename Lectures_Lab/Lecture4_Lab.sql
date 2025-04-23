-- Lab: Data Modeling & the Entity Relationship (ER) Model

-- Step 1: Create the Employee table
-- Task: Create a table to represent employees with a recursive relationship for managers.
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ManagerID INT,
    HireDate DATE,
    CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);

-- Step 2: Create the Department table
-- Task: Create a table to represent departments.
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Step 3: Create the Project table
-- Task: Create a table to represent projects.
CREATE TABLE Project (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100) NOT NULL
);

-- Step 4: Create the EmployeeProject table
-- Task: Create a junction table to represent the many-to-many relationship between employees and projects.
CREATE TABLE EmployeeProject (
    EmployeeID INT,
    ProjectID INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    CONSTRAINT FK_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT FK_Project FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

-- Step 5: Create the Dependent table
-- Task: Create a weak entity table to represent dependents of employees.
CREATE TABLE Dependent (
    DependentID INT PRIMARY KEY AUTO_INCREMENT,
    DependentName VARCHAR(50) NOT NULL,
    EmployeeID INT NOT NULL,
    CONSTRAINT FK_Dependent FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE
);

-- Step 6: Create the Role table
-- Task: Create a table to represent roles in a ternary relationship.
CREATE TABLE Role (
    RoleID INT PRIMARY KEY AUTO_INCREMENT,
    RoleName VARCHAR(50) NOT NULL
);

-- Step 7: Create the EmployeeProjectRole table
-- Task: Create a table to represent the ternary relationship between employees, projects, and roles.
CREATE TABLE EmployeeProjectRole (
    EmployeeID INT,
    ProjectID INT,
    RoleID INT,
    PRIMARY KEY (EmployeeID, ProjectID, RoleID),
    CONSTRAINT FK_EPR_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT FK_EPR_Project FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    CONSTRAINT FK_EPR_Role FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

-- Step 8: Insert sample data
-- Task: Populate the tables with sample data.

-- Insert data into Department
INSERT INTO Department (DepartmentName) VALUES ('HR'), ('IT'), ('Finance');

-- Insert data into Employee
INSERT INTO Employee (FirstName, LastName, ManagerID, HireDate)
VALUES 
('John', 'Smith', NULL, '2020-01-15'),
('Mary', 'Johnson', 1, '2019-03-10'),
('Alice', 'Brown', 1, '2021-07-22'),
('Dave', 'Wilson', 2, '2022-05-01');

-- Insert data into Project
INSERT INTO Project (ProjectName) VALUES ('Project A'), ('Project B');

-- Insert data into EmployeeProject
INSERT INTO EmployeeProject (EmployeeID, ProjectID) VALUES (1, 1), (2, 1), (2, 2), (3, 2);

-- Insert data into Dependent
INSERT INTO Dependent (DependentName, EmployeeID) VALUES ('Anna', 1), ('Ben', 2);

-- Insert data into Role
INSERT INTO Role (RoleName) VALUES ('Developer'), ('Manager');

-- Insert data into EmployeeProjectRole
INSERT INTO EmployeeProjectRole (EmployeeID, ProjectID, RoleID) VALUES (1, 1, 2), (2, 1, 1), (3, 2, 1);

-- Step 9: Queries
-- Task: Write queries to demonstrate the relationships.

-- Query 1: Display the manager-employee hierarchy.
SELECT e1.EmployeeID, e1.FirstName AS Employee, e2.FirstName AS Manager
FROM Employee e1
LEFT JOIN Employee e2 ON e1.ManagerID = e2.EmployeeID;

-- Query 2: Display employees and their projects.
SELECT e.FirstName, p.ProjectName
FROM Employee e
JOIN EmployeeProject ep ON e.EmployeeID = ep.EmployeeID
JOIN Project p ON ep.ProjectID = p.ProjectID;

-- Query 3: Display employees and their dependents.
SELECT e.FirstName AS Employee, d.DependentName AS Dependent
FROM Employee e
JOIN Dependent d ON e.EmployeeID = d.EmployeeID;

-- Query 4: Display employees, their projects, and roles.
SELECT e.FirstName, p.ProjectName, r.RoleName
FROM Employee e
JOIN EmployeeProjectRole epr ON e.EmployeeID = epr.EmployeeID
JOIN Project p ON epr.ProjectID = p.ProjectID
JOIN Role r ON epr.RoleID = r.RoleID;

-- End of Lab
