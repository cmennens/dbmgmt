USE [msdb]
SELECT	
	[database_name],
	[recovery_model],
	CASE	
		WHEN type = 'D' THEN 'Full'
		WHEN type = 'I' THEN 'Differential'
		WHEN type = 'L' THEN 'Log'
		END AS 'BackupType',
		[backup_start_date],
		[backup_finish_date],
		[user_name],
		[name] AS 'backup_application',
		backup_size/1024/1024/1024,
		compressed_backup_size/1024/1024/1024
FROM [backupset] AS b
ORDER BY b.[backup_start_date] DESC;
