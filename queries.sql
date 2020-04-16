-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT [PRODUCT].ProductName as 'Product', [CATEGORY].CategoryName AS 'Category'
FROM [PRODUCT]
JOIN [Category]
ON [PRODUCT].CategoryId = [CATEGORY].Id
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT [ORDER].Id, [SHIPPER].CompanyName AS 'Shipper', [ORDER].OrderDate
FROM [ORDER]
JOIN [SHIPPER]
ON [SHIPPER].Id = [ORDER].ShipVia
WHERE [ORDER].OrderDate < '2012-08-09'
ORDER BY [ORDER].OrderDate ASC
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT [PRODUCT].ProductName,[PRODUCT].QuantityPerUnit AS 'Quantity'
FROM [OrderDetail]
JOIN [Product]
ON [ORDERDETAIL].ProductId = [PRODUCT].Id
WHERE [ORDERDETAIL].OrderId = 10251
ORDER BY ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT [ORDER].Id as OrderID,[CUSTOMER].CompanyName, [EMPLOYEE].LastName AS 'Employee Last Name'
FROM [ORDER]
JOIN [CUSTOMER]
ON [ORDER].CustomerId = [CUSTOMER].Id
JOIN [Employee]
ON [ORDER].EmployeeId = [EMPLOYEE].Id