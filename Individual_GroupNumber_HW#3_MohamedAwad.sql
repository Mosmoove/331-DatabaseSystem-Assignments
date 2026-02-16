USE Northwinds2024Student;
---------------------------------------------------------------------
-- Microsoft SQL Server T-SQL Fundamentals
-- Chapter 03 - Joins
-- HW3 - Northwinds2024Student database
 -- Medium articles referenced: (1)The Ultimate Guide to SQL Join Types with Venn Diagrams and Real-Life Examples 
 --                             (2) Joining Strategies: Comprehensive Insight into SQL Join Types
---------------------------------------------------------------------

-- Question 1
-- Write a query that returns how many orders each customer has placed
-- Tables involved: Sales.Customer and Sales.Order
SELECT c.CustomerId, COUNT(o.OrderId) AS totalOrders
FROM Sales.Customer c
INNER JOIN Sales.[Order] o 
ON c.CustomerId = o.CustomerId 
GROUP BY c.CustomerId

-- Question 2
-- Write a query that returns the top 10 customers and their orders, including customers that placed no orders
-- Tables involved: Sales.Customer and Sales.Order 
SELECT TOP(10) c.CustomerId, c.CustomerCompanyName, o.OrderId, o.OrderDate 
FROM Sales.Customer c 
LEFT JOIN Sales.[Order] AS o -- Left join returns all rows from the left table and tries to match the ones on the right
ON c.CustomerId = o.CustomerId

-- Question 3
-- Write a query that generates all possible pairs with Employees and Categories -- involces using the CROSS JOIN
-- Tables involved: HumanResources.Employee and Production.Category
SELECT EmployeeId, CONCAT(EmployeeFirstName, ' ', EmployeeLastName) AS fullName, CategoryName 
FROM HumanResources.Employee
CROSS JOIN Production.Category -- Using the Cartesian product using 'CROSS JOIN' to produce all possible rows, making this an nxm table where n is the number of rows in HR.Employee and m is the number of rows in Categoriest table
ORDER BY EmployeeId

-- Question 4
-- Write a query that returns a table of French customers that have a shipping date on March 2022
-- Tables involved: Sales.Customer, Sales.Order
SELECT c.CustomerId, o.OrderDate, c.CustomerCountry
FROM Sales.Customer AS c
INNER JOIN Sales.[Order] AS o
ON c.CustomerId = o.CustomerId
WHERE c.CustomerCountry = 'France' AND (o.OrderDate BETWEEN '20220301' AND '20220331')

-- Question 5
-- Write a query that returns all rows where products have valid suppliers , nonmatchig rows can include nulls
-- Tables involved Production.Product and Production.Supplier
SELECT p.ProductId, p.ProductName, s.SupplierId, s.SupplierCompanyName
FROM Production.Product AS p
FULL OUTER JOIN Production.Supplier AS s
ON p.SupplierId = s.SupplierId;
