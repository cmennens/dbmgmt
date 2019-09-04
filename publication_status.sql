/***
How to check the status of a publication from the distributor in T-SQL
***/

USE [distribution];
GO

SELECT 
	   --a.[name], 
       --a.[publication], 
	   h.[start_time], 
	   h.[time], 
	   h.[comments]
FROM MSdistribution_history AS h 
	INNER JOIN MSdistribution_agents AS a 
	ON h.agent_id = a.id
ORDER BY [time] DESC;