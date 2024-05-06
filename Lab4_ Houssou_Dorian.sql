USE AdventureWorks2019

--1. (10pts) What is the employee directory, which includes employee’s FirstName, LastName, BirthDate, Gender, and HireDate (from Person.Person and HumanResources.Employee), ordered by LastName then FirstName?
USE AdventureWorks2019
SELECT 
    p.FirstName, p.LastName,e.BirthDate,e.Gender, e.HireDate
FROM  Person.Person p,HumanResources.Employee e 
WHERE p.BusinessEntityID = e.BusinessEntityID
ORDER BY 
    p.LastName, p.FirstName;


-- 2. (10pts) What are the person’s FirstName, LastName, OrderDate (from Person.Person and Sales.SalesOrderHeader), and ItemValue (calculated by OrderQty * UnitPrice from Sales.SalesOrderDetail) and where OrderDate is on or after May 1, 2014, ordered by the LastName then FirstName?
SELECT 
    p.FirstName, p.LastName, Sales.OrderDate, Sales.OrderQty * Sales.UnitPrice AS ItemValue
FROM  Person.Person p , Sales.SalesOrderHeader S, Sales.CustomerDetail d 
WHERE p.BusinessEntityID = h.CustomerID AND h.SalesOrderID = d.SalesOrderID AND
h.OrdeDate>= '2014-05-01'
ORDER BY 
    p.LastName, p.FirstName;

-- 3. (10pts) What are the SalesOrderID, CustomerID, TotalDue, TerritoryID, and Name (from Sales.SalesOrderHeader and Sales.SalesTerritory) for the sales order that was ordered in May 2014?
SELECT h.SalesOrderID, h.CustomerID, h.TotalDue, h.TerritoryID, t.Name
FROM Sales.SalesOrderHeader h, Sales.SalesTerritory t
WHERE h.TerritoryID = t.TerritoryID AND h.OrderDate BETWEEN '2014-05-01' AND '2014-05-01'

-- 4. (10pts) Laura Norman changed departments multiple times. What are the department name that Laura Norman worked for and also the date that Laura Norman started to work for each department, ordered by StartDate?
SELECT d.Name,h.StartDate
FROM Person.Person p, HumanResources.Employee e,
	HumanResources.EmployeeDepartmentHistory h, HumanResources.Department d
WHERE p.BusinessEntityID = e.BusinessEntityID AND 
	e.BusinessEntityID = h.BusinessEntityID AND
	h.DepartmentID = d.DepartmentID AND
	p.FirstName = 'Laura' AND p.LastName = 'Norman' 
ORDER BY h.StartDate