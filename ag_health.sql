-- Check the health of all AGs on the instance:

SELECT ag.[name] AS [AG Name], ag.Is_Distributed,
  ar.replica_server_name AS [Replica Name]
FROM sys.availability_groups AS ag
INNER JOIN sys.availability_replicas AS ar      
ON ag.group_id = ar.group_id;
GO
SELECT ag.[name] AS [AG Name], ag.is_distributed, ar.replica_server_name AS [Underlying AG],
       ars.role_desc AS [Role], ars.synchronization_health_desc AS [Sync Status]
FROM    sys.availability_groups AS ag
INNER JOIN sys.availability_replicas AS ar
ON    ag.group_id = ar.group_id       
INNER JOIN sys.dm_hadr_availability_replica_states AS ars      
ON   ar.replica_id = ars.replica_id
WHERE ag.is_distributed = 1;
GO
SELECT ag.[name] AS [Distributed AG Name], ar.replica_server_name AS [Underlying AG], dbs.[name] AS [Database],
       ars.role_desc AS [Role], drs.synchronization_health_desc AS [Sync Status], drs.log_send_queue_size,
    drs.log_send_rate, drs.redo_queue_size, drs.redo_rate
FROM sys.databases AS dbs
INNER JOIN sys.dm_hadr_database_replica_states AS drs
ON dbs.database_id = drs.database_id
INNER JOIN sys.availability_groups AS ag
ON drs.group_id = ag.group_id
INNER JOIN    sys.dm_hadr_availability_replica_states AS ars
ON ars.replica_id = drs.replica_id
INNER JOIN    sys.availability_replicas AS ar
ON ar.replica_id = ars.replica_id
WHERE ag.is_distributed = 1;
GO