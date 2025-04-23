-- Lab: Database Security

-- Step 1: Role-Based Access Control
CREATE ROLE ReadOnlyRole;
GRANT SELECT ON Customers TO ReadOnlyRole;

CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'password123';
GRANT ReadOnlyRole TO 'readonly_user'@'localhost';

-- Step 2: Encrypting Data
CREATE TABLE EncryptedData (
    DataID INT PRIMARY KEY AUTO_INCREMENT,
    SensitiveData VARBINARY(255)
);

-- Insert encrypted data
INSERT INTO EncryptedData (SensitiveData) VALUES (AES_ENCRYPT('SecretData', 'encryption_key'));

-- Query and decrypt data
SELECT AES_DECRYPT(SensitiveData, 'encryption_key') AS DecryptedData FROM EncryptedData;

-- Step 3: Auditing
CREATE TABLE AuditLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(100),
    Action VARCHAR(100),
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Trigger to log actions
CREATE TRIGGER LogInsert AFTER INSERT ON Customers
FOR EACH ROW
INSERT INTO AuditLog (UserName, Action) VALUES (USER(), 'INSERT INTO Customers');

-- End of Lab
