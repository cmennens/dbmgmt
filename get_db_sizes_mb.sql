WITH fs
AS
(
    SELECT database_id, type, size * 8.0 / 1024 size
    FROM sys.master_files
)
SELECT 
    name,
    (SELECT SUM(size) FROM fs WHERE type = 0 AND fs.database_id = db.database_id) DataFileSizeMB,
    (SELECT SUM(size) FROM fs WHERE type = 1 AND fs.database_id = db.database_id) LogFileSizeMB
FROM sys.databases db