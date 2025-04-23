-- This SQL file contains examples of backup and recovery procedures for databases.

-- Example of a full database backup
BACKUP DATABASE YourDatabaseName
TO DISK = 'C:\Backup\YourDatabaseName.bak'
WITH FORMAT, INIT, SKIP, NOREWIND, NOUNLOAD, STATS = 10;

-- Example of restoring a database from a backup
RESTORE DATABASE YourDatabaseName
FROM DISK = 'C:\Backup\YourDatabaseName.bak'
WITH REPLACE;

-- Example of backing up a specific table
BACKUP TABLE YourTableName
TO 'C:\Backup\YourTableName.bak';

-- Example of restoring a specific table (Note: This may require additional steps depending on the DBMS)
RESTORE TABLE YourTableName
FROM 'C:\Backup\YourTableName.bak';