USE AdventureWorks2019






--1. (4pts) What are all columns from the Production.ProductCostHistory table?

SELECT *
FROM Production.ProductCostHistory;

--2. (6pts) What are all columns from the Production.Product table, where the product Color is 'Black'?

SELECT *
FROM Production.Product
WHERE Color = 'Black';

--3. (6pts) What are BusinessEntityId, AcountNumber, Name, and CreditRating in the alphabetical order by Name from the Purchasing.Vendor table?

SELECT BusinessEntityID, AccountNumber, Name, CreditRating
FROM Purchasing.Vendor
ORDER BY Name;

--4. (6pts) What is the average of LineTotal (labels the result as Average Item Value) from the Sales.SalesOrderDetail table?

SELECT AVG(LineTotal) AS "Average Item Value"
FROM Sales.SalesOrderDetail;


--5. (6pts) What is the total (uses TotalDue column and labels the SUM as Sum_of_Orders) of allorders from the Sales.SalesOrderHeader table in August 2011 (i.e. from 2011-08-01 to 2011-08-31 inclusive)?

SELECT SUM(TotalDue) AS Sum_of_Orders
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2011-08-01' AND OrderDate <= '2011-08-31';

--6. (6pts) What is the total number of sales orders (uses Sales.SalesOrderHeader) that was paid with a credit card?
SELECT COUNT(*) AS TotalCreditCardOrders
FROM Sales.SalesOrderHeader
WHERE CreditCardApprovalCode IS NOT NULL;



-- Question 7 hat is the count of the number of addresses (uses Person.Address) that contain North as part of any attribute used to represent the addresses?


SELECT COUNT(AddressID) AS 'Count of Addresses'
FROM Person.Address
WHERE AddressLine1 LIKE '%NORTH%' OR AddressLine2 LIKE '%North%' OR City LIKE '%NORTH'

SELECT *
FROM Person.Address