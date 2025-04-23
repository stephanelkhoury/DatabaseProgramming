# Database Programming Wiki

Welcome to the Database Programming series! This section provides an overview of foundational concepts related to databases, emphasizing the limitations of using lists for data storage and the importance of relational databases.

## 🎯 Objectives
- Understand the limitations of storing data in lists.
- Identify key reasons organizations use databases.
- Learn how relational databases solve redundancy and anomaly issues.
- Understand the components of a database system.
- Introduce CRUD operations and the concept of a DBMS.

## 📦 Why Not Use Lists?
Storing data in lists can lead to several significant problems:

- **Redundancy**: Repeating data wastes space and increases the effort required for updates.
- **Multiple Themes**: A single row may contain data about multiple entities, complicating data management.
- **Data Anomalies**:
  - **Update Anomaly**: Updating information in multiple places is prone to errors.
  - **Deletion Anomaly**: Deleting a row may unintentionally remove important information.
  - **Insertion Anomaly**: Some data cannot be added without including unrelated data.

### 🌟 Example of Issues with Lists
Consider a file storing customer orders:

| Customer Name | Order ID | Product Name | Product Price |
|---------------|----------|--------------|---------------|
| Alice         | 101      | Laptop       | 1200          |
| Alice         | 102      | Mouse        | 20            |
| Bob           | 103      | Laptop       | 1200          |

- **Redundancy**: The Laptop and its price are repeated.
- **Update Anomaly**: If the Laptop price changes, all occurrences must be updated.
- **Deletion Anomaly**: Deleting Bob may also lose the Laptop price.

## 🗂️ Relational Databases
A relational database organizes data into tables:

- **Tables**: Represent entities (e.g., Customers, Orders).
- **Rows**: Represent individual records.
- **Columns**: Represent attributes of the entity.

### 🔗 How Tables Work Together
Data from different tables can be connected using JOIN operations based on shared IDs or keys.

### 🌟 Example of Relational Tables
**Customers Table**

| Customer ID | Name  | Phone       |
|-------------|-------|-------------|
| 1           | Alice | 123-456789  |
| 2           | Bob   | 987-654321  |

**Orders Table**

| Order ID | Customer ID | Product Name | Product Price |
|----------|-------------|--------------|---------------|
| 101      | 1           | Laptop       | 1200          |
| 102      | 1           | Mouse        | 20            |
| 103      | 2           | Laptop       | 1200          |

**Join Query Example**:
```sql
SELECT c.Name, o.Product_Name, o.Product_Price 
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID;
```

## 🔄 CRUD Operations
CRUD represents the basic operations on data:

- **Create**: Add new data.
- **Read**: Retrieve data.
- **Update**: Modify existing data.
- **Delete**: Remove data.

### 🌟 CRUD Examples in SQL
- **Create**:
```sql
INSERT INTO Customers (Name, Phone) VALUES ('Charlie', '555-123456');
```
- **Read**:
```sql
SELECT * FROM Customers WHERE Name = 'Alice';
```
- **Update**:
```sql
UPDATE Customers SET Phone = '555-654321' WHERE Name = 'Bob';
```
- **Delete**:
```sql
DELETE FROM Customers WHERE Name = 'Charlie';
```

## 🏗️ Components of a Database System
A database system typically consists of:

- **Users**: People or applications interacting with the database.
- **Database Applications**: Interfaces, such as websites, apps, or tools, that access data.
- **DBMS (Database Management System)**: Software managing the database and handling data access.
- **Database**: The structured repository where data is stored.

## 🧪 Structured Query Language (SQL)
SQL is the standard language for interacting with relational databases, supporting:

- **Data Definition**: Creating and modifying database structures.
- **Data Manipulation**: Performing CRUD operations.

### 🌟 Example Query
```sql
SELECT c.Last_Name, e.Amount_Paid, cr.Course_Name
FROM Customers c
JOIN Enrollments e ON c.Customer_ID = e.Customer_ID
JOIN Courses cr ON e.Course_ID = cr.Course_ID;
```

## 🛡️ DBMS Responsibilities
A DBMS performs critical tasks like:

- Managing databases and tables.
- Enforcing access control and security rules.
- Performing backups and recovery.
- Enforcing integrity constraints (e.g., referential integrity).

## 🧩 Types of Database Systems
- **Personal Database Systems**: Designed for individual users, simple and limited in capacity (e.g., Microsoft Access).
- **Enterprise-Level Database Systems**: Supports multiple users and large datasets, handling complex queries and distributed systems (e.g., MySQL, PostgreSQL, Oracle DB, SQL Server).

## ✅ Summary
Relational databases address key challenges in data storage by:

- Reducing redundancy and anomalies.
- Preserving data integrity.
- Modeling real-world relationships.
- Enabling powerful querying with SQL.

They offer scalable and reliable solutions for data management in both personal and enterprise environments.