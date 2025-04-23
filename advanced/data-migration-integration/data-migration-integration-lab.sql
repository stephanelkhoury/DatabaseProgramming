-- Lab: Data Migration and Integration

-- Step 1: Export Data
SELECT * FROM Customers INTO OUTFILE '/tmp/customers.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- Step 2: Import Data
LOAD DATA INFILE '/tmp/customers.csv' INTO TABLE Customers
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- Step 3: API Integration Simulation
CREATE TABLE APIResponse (
    ResponseID INT PRIMARY KEY AUTO_INCREMENT,
    ResponseData JSON
);

-- Insert simulated API response
INSERT INTO APIResponse (ResponseData) VALUES ('{"status": "success", "data": {"id": 1, "name": "Alice"}}');

-- Query API response
SELECT JSON_EXTRACT(ResponseData, '$.data.name') AS Name FROM APIResponse;

-- End of Lab
