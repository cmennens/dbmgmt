/*** How to manipulate a hostname change inside SQL Server ***/

USE [master] -- select database
GO           -- batch terminator

/*** Run the query below to get the current variables ***/ 

SELECT @@SERVERNAME AS '@@SERVERNAME', SERVERPROPERTY('ComputerNamePhysicalNetBIOS') AS SERVERPROPERTY_PHYS_NETBIOS, 
SERVERPROPERTY('InstanceName') AS SERVERPROPERTY_INSTANCENAME, SERVERPROPERTY('MachineName') AS SERVERPROPERTY_MACHINENAME,
SERVERPROPERTY('ServerName') AS SERVERPROPERTY_SERVERNAME
GO

/*** Run the following stored procedure to drop a SQL Server host named 'INFOSTORE1' ***/

EXEC sp_dropserver 'INFOSTORE1' 
GO 

/*** Run the following stored procedure to add a SQL Server host name 'INFOSTORE2' ***/

EXEC sp_addserver 'INFOSTORE2', LOCAL 
GO 

-- Make sure you restart MSSQLSERVER service from SQL Server Configuration Manager.