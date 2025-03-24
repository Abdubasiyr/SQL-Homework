--Easy-Level Tasks
--1.
select o.CustomerID,
       o.OrderID,
	   o.OrderDate
from Orders o
inner join Customers c on o.CustomerID = c.CustomerID and year(o.OrderDate) > 2022;

--2.
select e.Name,
       d.DepartmentName,
	   d.DepartmentID
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID and (d.DepartmentName = 'Sales' or d.DepartmentName = 'Marketing');

--3.
--Did not understand

--4.
select c.FirstName,
       c.LastName,
	   c.Country,
	   o.OrderDate
from Customers c 
join Orders o on c.CustomerID = o.CustomerID and (year(o.OrderDate) = 2023 and c.Country = 'USA');

--5.
--Did not understand

--6.
select p.ProductName,
       s.SupplierName
from Products p
join Suppliers s on p.SupplierID = s.SupplierID and (s.SupplierName = 'Gadget Supplies' or s.SupplierName = 'Clothing Mart');

--7.
--Did not understand


--Medium-Level Tasks
--8.
select c.FirstName,
       c.LastName,
       o.CustomerID,
       o.OrderID,
	   o.TotalAmount
from Orders o
inner join Customers c on o.CustomerID = c.CustomerID and o.TotalAmount > 500;

--9.
select p.ProductName,
       s.SaleDate,
	   s.SaleAmount
from Products p
join Sales s on p.ProductID = s.ProductID and (year(s.SaleDate) = 2022 or s.SaleAmount > 400);

--10.
--Did not understand

--11.
select e.Name,
       d.DepartmentName,
	   d.DepartmentID,
	   e.Salary
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID and (d.DepartmentName = 'Human Resources' and e.Salary > 50000);

--12.
--Did not understand

--13.
select p.ProductName,
       p.StockQuantity,
	   s.SaleDate
from Products p
join Sales s on p.ProductID = s.ProductID and (year(s.SaleDate) = 2023 and p.StockQuantity > 50);

--14.
select e.Name,
       d.DepartmentName,
	   d.DepartmentID,
	   e.HireDate
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID and (d.DepartmentName = 'Sales' or year(e.HireDate) > 2020);

--Hard-Level Tasks
--15.
select c.FirstName,
       c.LastName,
	   c.Address,
	   c.Country,
	   o.OrderDate
from Customers c 
join Orders o on c.CustomerID = o.CustomerID and (c.Address like '[0-9][0-9][0-9][0-9]%' and c.Country = 'USA');

--16.
select p.ProductName,
       c.CategoryName,
	   s.SaleAmount
from Products p 
join Categories c on p.Category = c.CategoryID 
join Sales s on s.ProductID = p.ProductID and (c.CategoryName = 'Electronics' or s.SaleAmount > 350);

--17.
--Did not understand

--18.
select c.FirstName,
       c.LastName,
	   c.Address,
	   c.City,
	   o.Quantity
from Customers c 
join Orders o on c.CustomerID = o.CustomerID and (c.City = 'Los Angeles' and o.Quantity > 300);

--19.
select e.Name,
       d.DepartmentName,
	   d.DepartmentID
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID 
and (d.DepartmentName = 'Human Resources' and d.DepartmentName = 'Finance')
or 
(LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'a', '')) 
      + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'e', '')) 
      + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'i', '')) 
      + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'o', '')) 
      + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'u', ''))) >= 4;

--20.
select p.ProductName,
       p.Price,
	   s.SaleAmount
from Products p 
join Sales s on p.ProductID = s.ProductID and (s.SaleAmount > 100 and p.Price > 500);

--21.
select e.Name,
       d.DepartmentName,
	   d.DepartmentID,
	   e.Salary
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID and (d.DepartmentName = 'Sales' or d.DepartmentName = 'Marketing')
and e.Salary > 60000;


