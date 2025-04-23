-- Access Control Example in SQL

-- Create a new role for database access
CREATE ROLE read_only;

-- Grant SELECT permission on the Customers table to the read_only role
GRANT SELECT ON Customers TO read_only;

-- Create a new user
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password123';

-- Grant the read_only role to the new user
GRANT read_only TO 'user1'@'localhost';

-- Revoke SELECT permission from the read_only role
REVOKE SELECT ON Customers FROM read_only;

-- Drop the user when no longer needed
DROP USER 'user1'@'localhost';

-- Drop the role when no longer needed
DROP ROLE read_only;