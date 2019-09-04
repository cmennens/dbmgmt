USE JProCo
GO

SELECT FirstName
	 , LastName
	 , LOWER(LEFT(FirstName, 1)) + LOWER(REPLACE(LastName, '''', '')) + '@gmail.com' AS EmailAddress
FROM Employee;
