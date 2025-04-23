-- Lab 3: SQL Practice Exercises

-- 1️⃣ Create Tables
-- Task: Create an Employee table and a Department table with the following structure:
-- Employee: empId (PK), empName, deptId (FK), salary
-- Department: deptId (PK), deptName

CREATE TABLE Department (
    deptId INTEGER NOT NULL,
    deptName TEXT NOT NULL,
    CONSTRAINT deptPk PRIMARY KEY (deptId)
);

CREATE TABLE Employee (
    empId INTEGER NOT NULL,
    empName TEXT NOT NULL,
    deptId INTEGER,
    salary DECIMAL(10, 2),
    CONSTRAINT empPk PRIMARY KEY (empId),
    CONSTRAINT deptFk FOREIGN KEY (deptId) REFERENCES Department(deptId) ON DELETE CASCADE
);

-- 2️⃣ Insert Data
-- Task: Populate the tables with sample data.

INSERT INTO Department (deptId, deptName) VALUES
(1, 'Sales'),
(2, 'Engineering'),
(3, 'HR');

INSERT INTO Employee (empId, empName, deptId, salary) VALUES
(101, 'Alice', 1, 60000),
(102, 'Bob', 2, 75000),
(103, 'Charlie', 1, 50000),
(104, 'Diana', 3, 45000),
(105, 'Eve', NULL, 70000);

-- 3️⃣ CRUD Operations
-- Task: Perform the following operations:
-- a) Add a new employee.
INSERT INTO Employee (empId, empName, deptId, salary) VALUES (106, 'Frank', 2, 80000);

-- b) Update an employee's salary.
UPDATE Employee SET salary = 55000 WHERE empId = 103;

-- c) Delete an employee.
DELETE FROM Employee WHERE empId = 105;

-- 4️⃣ SELECT Queries
-- Task: Write queries to:
-- a) Retrieve all employees in the Sales department.
SELECT empName FROM Employee WHERE deptId = 1;

-- b) Find employees earning more than $60,000.
SELECT empName, salary FROM Employee WHERE salary > 60000;

-- c) List all departments with the number of employees in each.
SELECT d.deptName, COUNT(e.empId) AS numOfEmployees
FROM Department d
LEFT JOIN Employee e ON d.deptId = e.deptId
GROUP BY d.deptName;

-- 5️⃣ Joins
-- Task: Use joins to:
-- a) Retrieve employee names along with their department names.
SELECT e.empName, d.deptName
FROM Employee e
INNER JOIN Department d ON e.deptId = d.deptId;

-- b) List all employees, including those without a department.
SELECT e.empName, d.deptName
FROM Employee e
LEFT OUTER JOIN Department d ON e.deptId = d.deptId;

-- 6️⃣ Views
-- Task: Create a view for employees in the Engineering department.
CREATE VIEW EngineeringEmployees AS
SELECT empName, salary FROM Employee WHERE deptId = 2;

-- Query the view.
SELECT * FROM EngineeringEmployees;

-- 7️⃣ Subqueries
-- Task: Use subqueries to:
-- a) Find employees earning above the average salary.
SELECT empName, salary FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- b) List departments with employees earning less than $50,000.
SELECT deptName FROM Department
WHERE deptId IN (
    SELECT deptId FROM Employee WHERE salary < 50000
);

-- End of Lab 3
