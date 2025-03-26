--1.
select e.Name,
       d.DepartmentName
from Employees e 
inner join Departments d on d.DepartmentID = e.DepartmentID;

--2.
select s.StudentName,
       c.ClassName
from Students s 
left join Classes c on c.ClassID = s.ClassID;

--3.
select c.CustomerName,
       o.OrderID
from Customers c 
right join Orders o on c.CustomerID = o.CustomerID;

--4.
select p.ProductName,
       s.SaleID
from Products p
full outer join Sales s on s.ProductID = p.ProductID;

--5.
select emp.Name,
       man.Name as ManagerName
from Employees emp 
join Employees man on emp.ManagerID = man.EmployeeID;

--6.
select c.ColorName, s.SizeName from Colors c
cross join Sizes s;

--7.
select m.Title,
       a.Name,
	   m.ReleaseYear
from Movies m 
inner join Actors a on m.MovieID = a.MovieID
where m.ReleaseYear > 2015;

--8.
select o.OrderDate,
       c.CustomerName,
	   od.ProductID
from Orders o 
join Customers c on o.CustomerID = c.CustomerID
join OrderDetails od on o.OrderID = od.OrderID;

--9.
select p.ProductName,
       sum(s.quantity * p.Price) as TotalRevenue
from Products p 
join Sales s on s.ProductID = p.ProductID
group by p.ProductName;
