BEGIN;

-- Example of a transaction to transfer funds between two accounts
-- Assume we have a table named 'Accounts' with columns 'AccountID', 'AccountName', and 'Balance'

-- Step 1: Deduct amount from the sender's account
UPDATE Accounts
SET Balance = Balance - 100
WHERE AccountID = 1;

-- Step 2: Add amount to the receiver's account
UPDATE Accounts
SET Balance = Balance + 100
WHERE AccountID = 2;

-- If both updates are successful, commit the transaction
COMMIT;

-- If there is an error, rollback the transaction to maintain data integrity
ROLLBACK; 

-- Example of a transaction with error handling
BEGIN;

-- Attempt to deduct amount from the sender's account
UPDATE Accounts
SET Balance = Balance - 200
WHERE AccountID = 1;

-- Check if the balance is sufficient
IF (SELECT Balance FROM Accounts WHERE AccountID = 1) < 0 THEN
    ROLLBACK; -- Rollback if insufficient funds
ELSE
    -- Proceed to add amount to the receiver's account
    UPDATE Accounts
    SET Balance = Balance + 200
    WHERE AccountID = 2;
    COMMIT; -- Commit if successful
END IF; 

-- Example of using SAVEPOINT to manage partial transactions
BEGIN;

SAVEPOINT before_update;

UPDATE Accounts
SET Balance = Balance - 50
WHERE AccountID = 1;

-- If an error occurs, rollback to the savepoint
IF (some_error_condition) THEN
    ROLLBACK TO before_update; -- Rollback to the savepoint
ELSE
    UPDATE Accounts
    SET Balance = Balance + 50
    WHERE AccountID = 2;
    COMMIT; -- Commit if successful
END IF; 

-- End of transactions example