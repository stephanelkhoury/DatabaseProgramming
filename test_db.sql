-- Create a new database for testing
CREATE DATABASE test_db;
USE test_db;

-- Employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- Departments table
CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Projects table
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15, 2)
);

-- Employee_Project table (Many-to-Many relationship)
CREATE TABLE employee_project (
    employee_id INT,
    project_id INT,
    role VARCHAR(50),
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

-- Customers table
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT
);

-- Orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    stock INT
);

-- Order_Details table (Many-to-Many relationship)
CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert sample data for Departments
INSERT INTO departments (name, location) VALUES
('HR', 'New York'),
('IT', 'San Francisco'),
('Finance', 'Chicago');

-- Insert sample data for Employees
INSERT INTO employees (name, position, department_id, salary, hire_date) VALUES
('Alice', 'Manager', 1, 75000.00, '2020-01-15'),
('Bob', 'Developer', 2, 60000.00, '2021-06-01'),
('Charlie', 'Analyst', 3, 50000.00, '2022-09-23');

-- Insert sample data for Projects
INSERT INTO projects (name, start_date, end_date, budget) VALUES
('Project Alpha', '2023-01-01', '2023-12-31', 1000000.00),
('Project Beta', '2024-01-01', '2024-06-30', 500000.00);

-- Insert sample data for Employee_Project
INSERT INTO employee_project (employee_id, project_id, role) VALUES
(1, 1, 'Lead'),
(2, 1, 'Developer'),
(3, 2, 'Analyst');

-- Insert sample data for Customers
INSERT INTO customers (name, email, phone, address) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street'),
('Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak Avenue');

-- Insert sample data for Orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2025-04-01', 150.00),
(2, '2025-04-15', 200.00);

-- Insert sample data for Products
INSERT INTO products (name, description, price, stock) VALUES
('Laptop', 'High-performance laptop', 1000.00, 50),
('Mouse', 'Wireless mouse', 20.00, 200),
('Keyboard', 'Mechanical keyboard', 50.00, 100);

-- Insert sample data for Order_Details
INSERT INTO order_details (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1000.00),
(1, 2, 2, 40.00),
(2, 3, 1, 50.00);