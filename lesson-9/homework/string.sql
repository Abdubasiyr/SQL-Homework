--Easy-Level Tasks
--1.
select e.Name, d.DepartmentName, d.DepartmentID, e.Salary
from Employees e 
inner join Departments d on d.DepartmentID = e.DepartmentID
where Salary > 5000;


--2.
select c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
from Customers c
inner join Orders o on c.CustomerID = o.CustomerID
where year(o.OrderDate) = 2023;


--3.
select e.Name,
       e.DepartmentID,
	   isnull(d.DepartmentName, 'Unknown') as DepartmentName
from Employees e
left outer join Departments d on d.DepartmentID = e.DepartmentID


--4.
select p.SupplierID,
       p.ProductName,
       s.SupplierName,
	   s.ContactName
from Products p
right outer join Suppliers s on s.SupplierID = p.SupplierID;


--5.
select o.OrderID, 
       p.PaymentID
from Orders o 
full outer join Payments p on o.OrderID = p.OrderID;


--6.
select a.Name as [EmployeeName], b.Name as [ManagerName] from Employees a
join Employees b on a.ManagerID = b.EmployeeID;


--7.
select e.EnrollmentID,
       s.Name, 
       c.CourseName
from Students s 
inner join Enrollments e on e.StudentID = s.StudentID
inner join Courses c on c.CourseID = e.CourseID
where CourseName = 'Math 101';


--8.
select c.CustomerID,
       c.FirstName,
	   c.LastName,
	   o.ProductID,
	   o.Quantity
from Customers c
inner join Orders o on o.CustomerID = c.CustomerID
where o.Quantity > 3;


--9.
select e.Name,
       d.DepartmentName
from Employees e 
left outer join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Human Resources';


--Medium-Level Tasks
--10.
select d.DepartmentName,
	   count(e.EmployeeID) as NumOfEmp
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
group by d.DepartmentName
having count(e.EmployeeID) >= 10;


--11.
select s.ProductID,
       p.ProductName
from Products p 
left outer join Sales s on p.ProductID = s.ProductID
where s.ProductID is null;


--12.
select c.CustomerID,
       count(o.OrderID) as NumOfOrd
from Customers c
right outer join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID
having count(o.OrderID) >= 1;


--13.
select e.Name,
       d.DepartmentName
from Employees e 
full outer join Departments d on e.DepartmentID = d.DepartmentID
where DepartmentName is null;


--14.
SELECT a.Name AS Employee, b.Name AS Colleague, a.ManagerID
FROM Employees a
JOIN Employees b ON a.ManagerID = b.ManagerID
WHERE a.EmployeeID <> b.EmployeeID
ORDER BY a.ManagerID, a.Name; --Ask from teacher


--15.
select c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
from Customers c
left outer join Orders o on c.CustomerID = o.CustomerID
where year(o.OrderDate) = 2022;


--16.
select e.Name,
       d.DepartmentName,
	   e.Salary
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Sales' and e.Salary > 5000;


--17.
select e.Name,
       d.DepartmentName
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'IT';


--18.
select o.OrderID, 
       p.PaymentID
from Orders o 
full outer join Payments p on o.OrderID = p.OrderID
where p.PaymentID is not null and o.OrderID is not null;


--19.
select o.ProductID,
       o.OrderID,
       p.ProductName
from Products p 
left outer join Orders o on p.ProductID = o.ProductID
where o.ProductID is null;


--Hard-Level Tasks 
--20.
select e.Name
	   avg(e.Salary) as AvgSal
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
group by e.Name
having avg(e.Salary) < e.Salary 
--Ask from teacher


SELECT e.Name, e.Salary
FROM Employees e
WHERE e.Salary > (SELECT AVG(Salary) FROM Employees);
--Not done


--21.
select o.OrderID, 
       p.PaymentID
from Orders o 
left outer join Payments p on o.OrderID = p.OrderID
where p.PaymentID is null and year(o.OrderDate) < 2020;


--22.
select p.ProductName,
       c.CategoryName
from Products p
full outer join Categories c on c.CategoryID = p.Category
where CategoryName is null;


--23.
SELECT a.Name AS Employee, b.Name AS Colleague, a.Salary, a.ManagerID
FROM Employees a
JOIN Employees b ON a.ManagerID = b.ManagerID
WHERE a.EmployeeID <> b.EmployeeID and a.Salary > 5000
ORDER BY a.ManagerID, a.Name;  --Ask from teacher


--24.
select e.Name,
       d.DepartmentName
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName like 'M%';


--25.
select s.CustomerID,
       p.ProductID,
       p.ProductName,
	   s.SaleID,
	   p.Price
from Products p 
join Sales s on p.ProductID = s.ProductID
where p.Price > 1000;


--26.
select e.EnrollmentID,
       s.Name, 
       c.CourseName
from Students s 
left outer join Enrollments e on e.StudentID = s.StudentID
left outer join Courses c on c.CourseID = e.CourseID
where CourseName != 'Math 101';


--27.
select o.OrderID, 
       p.PaymentID
from Orders o 
full outer join Payments p on o.OrderID = p.OrderID
where p.PaymentID is null;


--28.
select p.ProductName,
       c.CategoryName
from Products p
inner join Categories c on c.CategoryID = p.Category
where CategoryName = 'Electronics' or CategoryName = 'Furniture';










       





