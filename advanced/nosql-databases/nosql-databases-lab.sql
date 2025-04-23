-- Lab: Simulating NoSQL Concepts

-- Step 1: Key-Value Store Simulation
CREATE TABLE KeyValueStore (
    KeyName VARCHAR(100) PRIMARY KEY,
    Value TEXT
);

-- Insert data
INSERT INTO KeyValueStore (KeyName, Value) VALUES ('User:1', '{"name": "Alice", "age": 30}');

-- Query data
SELECT Value FROM KeyValueStore WHERE KeyName = 'User:1';

-- Step 2: Document Store Simulation
CREATE TABLE DocumentStore (
    DocumentID INT PRIMARY KEY AUTO_INCREMENT,
    Document JSON
);

-- Insert JSON data
INSERT INTO DocumentStore (Document) VALUES ('{"name": "Bob", "skills": ["Java", "SQL"]}');

-- Query JSON data
SELECT JSON_EXTRACT(Document, '$.name') AS Name FROM DocumentStore;

-- Step 3: Wide-Column Store Simulation
CREATE TABLE WideColumnStore (
    RowKey VARCHAR(100),
    ColumnName VARCHAR(100),
    Value TEXT,
    PRIMARY KEY (RowKey, ColumnName)
);

-- Insert data
INSERT INTO WideColumnStore (RowKey, ColumnName, Value) VALUES ('User:1', 'Name', 'Alice');

-- Query data
SELECT Value FROM WideColumnStore WHERE RowKey = 'User:1' AND ColumnName = 'Name';

-- End of Lab
