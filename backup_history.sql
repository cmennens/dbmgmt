USE [msdb]
select	database_name,
		recovery_model,
		case	when type = 'D' then 'Full'
				when type = 'I' then 'Differential'
				when type = 'L' then 'Log'
		end 'backup_type',
		backup_start_date,
		backup_finish_date,
		user_name,
		name 'backup_application',
		backup_size/1024/1024/1024,
		compressed_backup_size/1024/1024/1024
from backupset as b
where b.database_name = 'QoreVerify' -- remove this line to query all db history
order by b.backup_start_date desc
