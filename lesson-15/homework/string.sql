--1.
SELECT EmployeeID, Salary
FROM (
    SELECT EmployeeID, Salary
    FROM Employees
) AS emp
WHERE Salary > (
    SELECT AVG(Salary) FROM Employees
);

--2.
with cte as (
    select Salary from Employees
	group by Salary 
	having count(*) > 1
) 
select e.EmployeeID, e.Salary 
from Employees e
join cte c on e.Salary = c.Salary 

--3.
WITH DepartmentCounts AS (
    SELECT DepartmentID, COUNT(*) AS EmployeeCount
    FROM Employees
    GROUP BY DepartmentID
)
SELECT DepartmentID, EmployeeCount
FROM DepartmentCounts;

--4.
SELECT EmployeeID, Salary
FROM (
    SELECT EmployeeID, Salary
    FROM Employees
) AS emp
WHERE Salary < (
    SELECT AVG(Salary) FROM Employees
);


--5.
with cte as (
   select ProductID, count(*) as SaleCount
   from Sales
   group by ProductID
)
select ProductID 
from cte 
where SaleCount >= 2


--6.
select EmployeeID, SalesAmount 
from (
    select EmployeeID, SalesAmount 
	from Sales
) as a 
where SalesAmount > 2000


--7.
SELECT ProductID, ProductName, Price
FROM (
    SELECT ProductID, ProductName, Price
    FROM Products
) AS DerivedTable
where Price = (
     select max(Price) from Products)

--8.
with cte as (
    select EmployeeID, sum(SalesAmount) as TotalSales
	from Sales
	group by EmployeeID
)
select EmployeeID, TotalSales
from cte

--9.
WITH LaptopSales AS (
    SELECT DISTINCT EmployeeID
    FROM Sales
    WHERE ProductName = 'Laptop'
)
SELECT e.EmployeeID, e.EmployeeName
FROM Employees e
JOIN LaptopSales ls ON e.EmployeeID = ls.EmployeeID;


--10.
SELECT e.EmployeeID, e.Salary, d.DepartmentName
FROM Employees e
JOIN (
    SELECT DepartmentID, MAX(Salary) AS MaxSalary
    FROM Employees
    GROUP BY DepartmentID
) AS MaxSalaries
ON e.DepartmentID = MaxSalaries.DepartmentID
AND e.Salary = MaxSalaries.MaxSalary
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

--11. Find departments with no employees (CTE)
WITH DepartmentsWithNoEmployees AS (
    SELECT d.DepartmentID
    FROM Departments d
    LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
    WHERE e.EmployeeID IS NULL
)
SELECT DepartmentID
FROM DepartmentsWithNoEmployees;

-- 12. Find employees who have made the same total sales as another employee (CTE)
WITH EmployeeSales AS (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e1.EmployeeID, e1.TotalSales
FROM EmployeeSales e1
JOIN EmployeeSales e2 ON e1.TotalSales = e2.TotalSales AND e1.EmployeeID <> e2.EmployeeID;

-- 13. Find the total revenue generated per product category (CTE)
WITH RevenuePerCategory AS (
    SELECT ProductCategory, SUM(SalesAmount) AS TotalRevenue
    FROM Sales
    GROUP BY ProductCategory
)
SELECT ProductCategory, TotalRevenue
FROM RevenuePerCategory;

-- 14. Find the top 3 highest-paid employees per department (Derived Table)
SELECT e.EmployeeID, e.EmployeeName, e.Salary, e.DepartmentID
FROM Employees e
JOIN (
    SELECT DepartmentID, Salary
    FROM Employees
    WHERE Salary IN (
        SELECT TOP 3 Salary
        FROM Employees e2
        WHERE e2.DepartmentID = e.DepartmentID
        ORDER BY Salary DESC
    )
) AS TopSalaries ON e.EmployeeID = TopSalaries.EmployeeID
ORDER BY e.DepartmentID, e.Salary DESC;

-- 15. Find employees who have the highest number of sales transactions (Derived Table)
SELECT e.EmployeeID, e.EmployeeName, ts.TotalTransactions
FROM Employees e
JOIN (
    SELECT EmployeeID, COUNT(*) AS TotalTransactions
    FROM Sales
    GROUP BY EmployeeID
) AS ts ON e.EmployeeID = ts.EmployeeID
ORDER BY ts.TotalTransactions DESC
LIMIT 1;

-- 16. Find employees who sold more than 3 different products (CTE)
WITH EmployeeProducts AS (
    SELECT EmployeeID, COUNT(DISTINCT ProductID) AS DistinctProducts
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.EmployeeID, e.EmployeeName
FROM EmployeeProducts ep
JOIN Employees e ON ep.EmployeeID = e.EmployeeID
WHERE ep.DistinctProducts > 3;

-- 17. Find the department with the highest total salary (Derived Table)
SELECT d.DepartmentID, d.DepartmentName, ts.TotalSalary
FROM Departments d
JOIN (
    SELECT DepartmentID, SUM(Salary) AS TotalSalary
    FROM Employees
    GROUP BY DepartmentID
) AS ts ON d.DepartmentID = ts.DepartmentID
ORDER BY ts.TotalSalary DESC
LIMIT 1;

-- 18. Find employees who made sales higher than their department's average sales (Derived Table)
SELECT e.EmployeeID, e.EmployeeName, s.TotalSales, avg_sales.AvgSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales, DepartmentID
    FROM Sales
    GROUP BY EmployeeID, DepartmentID
) AS s ON e.EmployeeID = s.EmployeeID
JOIN (
    SELECT DepartmentID, AVG(SalesAmount) AS AvgSales
    FROM Sales
    GROUP BY DepartmentID
) AS avg_sales ON e.DepartmentID = avg_sales.DepartmentID
WHERE s.TotalSales > avg_sales.AvgSales;

--19.
SELECT e.EmployeeID, e.EmployeeName, e.Salary, s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) AS s ON e.EmployeeID = s.EmployeeID
WHERE s.TotalSales > e.Salary;


--20.
SELECT d.DepartmentID, d.DepartmentName, ts.TotalTransactions
FROM Departments d
JOIN (
    SELECT e.DepartmentID, COUNT(*) AS TotalTransactions
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    GROUP BY e.DepartmentID
) AS ts ON d.DepartmentID = ts.DepartmentID
ORDER BY ts.TotalTransactions DESC
LIMIT 1;


--21.
SELECT s.ProductID, e.EmployeeID, e.EmployeeName, ts.TotalSales
FROM Sales s
JOIN Employees e ON s.EmployeeID = e.EmployeeID
JOIN (
    SELECT ProductID, EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID, EmployeeID
) AS ts ON s.ProductID = ts.ProductID AND s.EmployeeID = ts.EmployeeID
WHERE ts.TotalSales = (
    SELECT MAX(TotalSales)
    FROM (
        SELECT ProductID, EmployeeID, SUM(SalesAmount) AS TotalSales
        FROM Sales
        GROUP BY ProductID, EmployeeID
    ) AS inner_ts
    WHERE inner_ts.ProductID = ts.ProductID
)
ORDER BY s.ProductID;








