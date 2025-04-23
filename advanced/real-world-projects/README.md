# Real-World Projects

This folder contains a capstone project that involves designing a database for an e-commerce platform.

## Inputs

1. **Entities**:
   - `Customers`: Stores customer details.
   - `Products`: Stores product details.
   - `Orders`: Stores order details.
   - `OrderDetails`: Stores details of products in each order.

2. **Relationships**:
   - One-to-many: `Customers` → `Orders`.
   - Many-to-many: `Orders` ↔ `Products` (via `OrderDetails`).

3. **Queries**:
   - Retrieve customer orders and their details.
   - Analyze sales data.

## Lab File
Refer to the `ecommerce-project-lab.sql` file for the SQL implementation of this project.