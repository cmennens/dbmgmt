USE TSQL2012; 
GO

IF OBJECT_ID('Sales.MyOrders') IS NOT NULL DROP TABLE Sales.MyOrders; 
GO
  
CREATE TABLE Sales.MyOrders;
GO