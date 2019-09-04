USE [master];
GO

IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = N'dbName')
    CREATE DATABASE Carlson;
GO

IF NOT EXISTS(SELECT * FROM sysobjects WHERE name='tblName' AND xtype='U')
    CREATE TABLE tblName 
	(
        col1 int NOT NULL, 
		col2 varchar(100) NULL CONSTRAINT DF_tblName_col2 DEFAULT('YES'),
		col3 datetime2 NOT NULL CONSTRAINT DF_tblName_col3 DEFAULT (GETUTCDATE()),
		col4 bit NOT NULL CONSTRAINT DF_tblName_col4 DEFAULT(1)	,
		col5 numeric(7,2) NOT NULL,
		CONSTRAINT PK_tblName_col1 PRIMARY KEY CLUSTERED(col1),   
		CONSTRAINT CK_tblName_col3 CHECK(col3 >= GETDATE())         
    );
GO