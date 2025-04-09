--1.
select ProductID, TotalSales
from 
(select ProductID, sum(SalesAmount) as TotalSales
from Sales
group by ProductID) a 

--2.
WITH AvgSalary AS (
    SELECT AVG(Salary) AS avg_sal
    FROM Employees
)
SELECT avg_sal
FROM AvgSalary

--3.
select ProductID, TheHighestSales
from ( 
       select ProductID, max(SalesAmount) as TheHighestSales
	   from Sales
	   group by ProductID
) a

--4.
WITH SalesCountCTE AS (
    SELECT EmployeeID, COUNT(*) AS SalesCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.Name
FROM SalesCountCTE s
JOIN Employees e ON e.EmployeeID = s.EmployeeID
WHERE s.SalesCount > 5;


--5.
SELECT TOP 5 c.CustomerID, c.Name, purchases.TotalAmount
FROM Customers c
JOIN (
    SELECT CustomerID, SUM(PurchaseAmount) AS TotalAmount
    FROM Orders
    GROUP BY CustomerID
) purchases ON c.CustomerID = purchases.CustomerID
ORDER BY purchases.TotalAmount DESC;


--6.
WITH ProductSalesCTE AS (
    SELECT ProductID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
)
SELECT p.ProductName, ps.TotalSales
FROM ProductSalesCTE ps
JOIN Products p ON p.ProductID = ps.ProductID
WHERE ps.TotalSales > 500;

--7.
SELECT c.CustomerID, c.Name, o.OrderCount
FROM Customers c
JOIN (
    SELECT CustomerID, COUNT(*) AS OrderCount
    FROM Orders
    GROUP BY CustomerID
) o ON c.CustomerID = o.CustomerID;


--8.
WITH AvgSalaryCTE AS (
    SELECT AVG(Salary) AS AvgSalary
    FROM Employees
)
SELECT e.EmployeeID, e.Name, e.Salary
FROM Employees e
JOIN AvgSalaryCTE a ON e.Salary > a.AvgSalary;


--9.
SELECT SUM(ProductCount) AS TotalProductsSold
FROM (
    SELECT SUM(Quantity) AS ProductCount
    FROM OrderDetails
) AS TotalTable;


--10.
WITH SalesCTE AS (
    SELECT DISTINCT EmployeeID
    FROM Sales
)
SELECT e.EmployeeID, e.Name
FROM Employees e
LEFT JOIN SalesCTE s ON e.EmployeeID = s.EmployeeID
WHERE s.EmployeeID IS NULL;


--11.
SELECT r.RegionName, sales.TotalRevenue
FROM Regions r
JOIN (
    SELECT RegionID, SUM(SaleAmount) AS TotalRevenue
    FROM Sales
    GROUP BY RegionID
) sales ON r.RegionID = sales.RegionID;


--12.
WITH SeniorEmployees AS (
    SELECT EmployeeID, Name, DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsWorked
    FROM Employees
)
SELECT * FROM SeniorEmployees
WHERE YearsWorked > 5;


--13.
SELECT c.CustomerID, c.Name, orders.OrderCount
FROM Customers c
JOIN (
    SELECT CustomerID, COUNT(*) AS OrderCount
    FROM Orders
    GROUP BY CustomerID
) orders ON c.CustomerID = orders.CustomerID
WHERE orders.OrderCount > 3;


--14.
WITH DepartmentSales AS (
    SELECT EmployeeID, DepartmentID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DepartmentID
),
RankedSales AS (
    SELECT *, RANK() OVER (PARTITION BY DepartmentID ORDER BY TotalSales DESC) AS SalesRank
    FROM DepartmentSales
)
SELECT e.Name, e.DepartmentID, r.TotalSales
FROM RankedSales r
JOIN Employees e ON r.EmployeeID = e.EmployeeID
WHERE r.SalesRank = 1;


--15.
SELECT c.CustomerID, c.Name, avg_orders.AvgOrderValue
FROM Customers c
JOIN (
    SELECT CustomerID, AVG(OrderAmount) AS AvgOrderValue
    FROM Orders
    GROUP BY CustomerID
) avg_orders ON c.CustomerID = avg_orders.CustomerID;


--16.
WITH DeptEmployeeCount AS (
    SELECT DepartmentID, COUNT(*) AS EmployeeCount
    FROM Employees
    GROUP BY DepartmentID
)
SELECT d.DepartmentName, e.EmployeeCount
FROM Departments d
JOIN DeptEmployeeCount e ON d.DepartmentID = e.DepartmentID;


--17.
SELECT p.ProductID, p.ProductName, qtr_sales.TotalQty
FROM Products p
JOIN (
    SELECT ProductID, SUM(Quantity) AS TotalQty
    FROM Sales
    WHERE SaleDate >= DATEADD(QUARTER, -1, GETDATE())
    GROUP BY ProductID
) qtr_sales ON p.ProductID = qtr_sales.ProductID
ORDER BY qtr_sales.TotalQty DESC;


--18.
WITH SalesCTE AS (
    SELECT EmployeeID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.Name, s.TotalSales
FROM SalesCTE s
JOIN Employees e ON e.EmployeeID = s.EmployeeID
WHERE s.TotalSales > 1000;


--19.
SELECT c.CustomerID, c.Name, o.OrderCount
FROM Customers c
JOIN (
    SELECT CustomerID, COUNT(*) AS OrderCount
    FROM Orders
    GROUP BY CustomerID
) o ON c.CustomerID = o.CustomerID;


--20.
WITH MonthlySales AS (
    SELECT EmployeeID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -1, GETDATE())
    GROUP BY EmployeeID
)
SELECT e.Name, m.TotalSales
FROM MonthlySales m
JOIN Employees e ON m.EmployeeID = e.EmployeeID;

-- 1. Running total of sales per employee using CTE
WITH SalesCTE AS (
    SELECT EmployeeID, SaleDate, SaleAmount,
           SUM(SaleAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS RunningTotal
    FROM Sales
)
SELECT * FROM SalesCTE;

-- 2. Recursive CTE to generate sequence 1 to 10
WITH Numbers AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num + 1 FROM Numbers WHERE Num < 10
)
SELECT * FROM Numbers;

-- 3. Average sales per region (derived table)
SELECT r.RegionName, avg_data.AvgSales
FROM Regions r
JOIN (
    SELECT RegionID, AVG(SaleAmount) AS AvgSales
    FROM Sales
    GROUP BY RegionID
) avg_data ON r.RegionID = avg_data.RegionID;

-- 4. Rank employees by total sales (CTE)
WITH TotalSales AS (
    SELECT EmployeeID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
), RankedEmployees AS (
    SELECT EmployeeID, TotalSales,
           RANK() OVER (ORDER BY TotalSales DESC) AS RankPos
    FROM TotalSales
)
SELECT * FROM RankedEmployees;

-- 5. Top 5 employees by number of orders (derived table)
SELECT TOP 5 e.Name, o.OrderCount
FROM Employees e
JOIN (
    SELECT EmployeeID, COUNT(*) AS OrderCount
    FROM Orders
    GROUP BY EmployeeID
) o ON e.EmployeeID = o.EmployeeID
ORDER BY o.OrderCount DESC;

-- 6. Recursive CTE: employees under a manager
WITH RecursiveCTE AS (
    SELECT EmployeeID, Name, ManagerID
    FROM Employees
    WHERE ManagerID = @ManagerID
    UNION ALL
    SELECT e.EmployeeID, e.Name, e.ManagerID
    FROM Employees e
    JOIN RecursiveCTE r ON e.ManagerID = r.EmployeeID
)
SELECT * FROM RecursiveCTE;

-- 7. Sales difference between current and previous month (CTE)
WITH MonthlySales AS (
    SELECT EmployeeID, MONTH(SaleDate) AS Month, YEAR(SaleDate) AS Year, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, YEAR(SaleDate), MONTH(SaleDate)
), DiffCTE AS (
    SELECT a.EmployeeID, a.Month, a.Year, a.TotalSales - ISNULL(b.TotalSales, 0) AS SalesDifference
    FROM MonthlySales a
    LEFT JOIN MonthlySales b
      ON a.EmployeeID = b.EmployeeID AND a.Month = b.Month + 1 AND a.Year = b.Year
)
SELECT * FROM DiffCTE;

-- 8. Derived table: top employee in each department
SELECT e.EmployeeID, e.Name, e.DepartmentID, s.MaxSales
FROM Employees e
JOIN (
    SELECT DepartmentID, EmployeeID, MAX(SaleAmount) AS MaxSales
    FROM Sales
    GROUP BY DepartmentID, EmployeeID
) s ON e.EmployeeID = s.EmployeeID;

-- 9. Recursive CTE: ancestors of an employee
WITH Ancestors AS (
    SELECT EmployeeID, ManagerID
    FROM Employees
    WHERE EmployeeID = @EmployeeID
    UNION ALL
    SELECT e.EmployeeID, e.ManagerID
    FROM Employees e
    JOIN Ancestors a ON e.EmployeeID = a.ManagerID
)
SELECT * FROM Ancestors;

-- 10. Employees with no sales in the last year (CTE)
WITH LastYearSales AS (
    SELECT DISTINCT EmployeeID
    FROM Sales
    WHERE SaleDate >= DATEADD(YEAR, -1, GETDATE())
)
SELECT e.EmployeeID, e.Name
FROM Employees e
LEFT JOIN LastYearSales s ON e.EmployeeID = s.EmployeeID
WHERE s.EmployeeID IS NULL;

-- 11. Total sales per region and year (derived table)
SELECT r.RegionName, sales.Year, sales.TotalSales
FROM Regions r
JOIN (
    SELECT RegionID, YEAR(SaleDate) AS Year, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY RegionID, YEAR(SaleDate)
) sales ON r.RegionID = sales.RegionID;

-- 12. Recursive CTE: factorial
WITH FactorialCTE AS (
    SELECT 1 AS Num, 1 AS Factorial
    UNION ALL
    SELECT Num + 1, (Num + 1) * Factorial
    FROM FactorialCTE
    WHERE Num < @InputNumber
)
SELECT * FROM FactorialCTE;

-- 13. Customers with more than 10 orders (derived table)
SELECT c.CustomerID, c.Name, o.OrderCount
FROM Customers c
JOIN (
    SELECT CustomerID, COUNT(*) AS OrderCount
    FROM Orders
    GROUP BY CustomerID
) o ON c.CustomerID = o.CustomerID
WHERE o.OrderCount > 10;

-- 14. Recursive CTE: product category hierarchy
WITH CategoryTree AS (
    SELECT CategoryID, ParentCategoryID, CategoryName
    FROM ProductCategories
    WHERE ParentCategoryID IS NULL
    UNION ALL
    SELECT c.CategoryID, c.ParentCategoryID, c.CategoryName
    FROM ProductCategories c
    JOIN CategoryTree t ON c.ParentCategoryID = t.CategoryID
)
SELECT * FROM CategoryTree;

-- 15. Rank products by total sales in the last year (CTE)
WITH ProductSales AS (
    SELECT ProductID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(YEAR, -1, GETDATE())
    GROUP BY ProductID
)
SELECT ProductID, TotalSales,
       RANK() OVER (ORDER BY TotalSales DESC) AS RankPos
FROM ProductSales;

-- 16. Sales per product category (derived table)
SELECT pc.CategoryName, SUM(s.SaleAmount) AS TotalSales
FROM (
    SELECT p.CategoryID, s.SaleAmount
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
) s
JOIN ProductCategories pc ON pc.CategoryID = s.CategoryID
GROUP BY pc.CategoryName;

-- 17. Employees with highest sales growth (CTE)
WITH CurrentYear AS (
    SELECT EmployeeID, SUM(SaleAmount) AS CurrentSales
    FROM Sales
    WHERE YEAR(SaleDate) = YEAR(GETDATE())
    GROUP BY EmployeeID
),
LastYear AS (
    SELECT EmployeeID, SUM(SaleAmount) AS LastSales
    FROM Sales
    WHERE YEAR(SaleDate) = YEAR(GETDATE()) - 1
    GROUP BY EmployeeID
),
Growth AS (
    SELECT c.EmployeeID, c.CurrentSales - ISNULL(l.LastSales, 0) AS Growth
    FROM CurrentYear c
    LEFT JOIN LastYear l ON c.EmployeeID = l.EmployeeID
)
SELECT e.Name, g.Growth
FROM Growth g
JOIN Employees e ON g.EmployeeID = e.EmployeeID
ORDER BY g.Growth DESC;

-- 18. Derived table: employees with sales over $5000 per quarter
SELECT e.Name, qtr.Quarter, qtr.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID,
           DATEPART(QUARTER, SaleDate) AS Quarter,
           SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
) qtr ON e.EmployeeID = qtr.EmployeeID
WHERE qtr.TotalSales > 5000;

-- 19. Recursive CTE: descendants of a product category
WITH Descendants AS (
    SELECT CategoryID, ParentCategoryID
    FROM ProductCategories
    WHERE CategoryID = @CategoryID
    UNION ALL
    SELECT c.CategoryID, c.ParentCategoryID
    FROM ProductCategories c
    JOIN Descendants d ON c.ParentCategoryID = d.CategoryID
)
SELECT * FROM Descendants;

-- 20. Top 3 employees by sales in last month (derived table)
SELECT TOP 3 e.Name, s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -1, GETDATE())
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID
ORDER BY s.TotalSales DESC;


-- 1. Recursive CTE: Fibonacci sequence up to 20th term
WITH Fibonacci (n, value1, value2) AS (
    SELECT 1, 0, 1
    UNION ALL
    SELECT n + 1, value2, value1 + value2
    FROM Fibonacci
    WHERE n < 20
)
SELECT n, value1 AS FibonacciValue FROM Fibonacci;

-- 2. CTE: cumulative sales over the past year
WITH SalesLastYear AS (
    SELECT EmployeeID, SaleDate, SaleAmount,
           SUM(SaleAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS CumulativeSales
    FROM Sales
    WHERE SaleDate >= DATEADD(YEAR, -1, GETDATE())
)
SELECT * FROM SalesLastYear;

-- 3. Recursive CTE: subordinates of a manager
WITH Subordinates AS (
    SELECT EmployeeID, ManagerID, Name
    FROM Employees
    WHERE ManagerID = @ManagerID
    UNION ALL
    SELECT e.EmployeeID, e.ManagerID, e.Name
    FROM Employees e
    JOIN Subordinates s ON e.ManagerID = s.EmployeeID
)
SELECT * FROM Subordinates;

-- 4. Derived table: employees with sales above company avg per region
SELECT e.EmployeeID, e.Name, r.RegionName, s.TotalSales
FROM Employees e
JOIN Regions r ON e.RegionID = r.RegionID
JOIN (
    SELECT EmployeeID, RegionID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, RegionID
) s ON e.EmployeeID = s.EmployeeID
JOIN (
    SELECT RegionID, AVG(SaleAmount) AS AvgSales
    FROM Sales
    GROUP BY RegionID
) a ON e.RegionID = a.RegionID
WHERE s.TotalSales > a.AvgSales;

-- 5. Recursive CTE: product depth in hierarchy
WITH ProductDepth AS (
    SELECT CategoryID, ParentCategoryID, 1 AS Depth
    FROM ProductCategories
    WHERE ParentCategoryID IS NULL
    UNION ALL
    SELECT pc.CategoryID, pc.ParentCategoryID, pd.Depth + 1
    FROM ProductCategories pc
    JOIN ProductDepth pd ON pc.ParentCategoryID = pd.CategoryID
)
SELECT * FROM ProductDepth;

-- 6. CTE + derived table: sales totals by department and product
WITH DeptProductSales AS (
    SELECT e.DepartmentID, p.ProductID, SUM(s.SaleAmount) AS TotalSales
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    JOIN Products p ON s.ProductID = p.ProductID
    GROUP BY e.DepartmentID, p.ProductID
)
SELECT d.Name AS Department, p.Name AS Product, dps.TotalSales
FROM DeptProductSales dps
JOIN Departments d ON dps.DepartmentID = d.DepartmentID
JOIN Products p ON dps.ProductID = p.ProductID;

-- 7. Recursive CTE: all direct and indirect reports
WITH Reports AS (
    SELECT EmployeeID, ManagerID, Name
    FROM Employees
    WHERE ManagerID = @ManagerID
    UNION ALL
    SELECT e.EmployeeID, e.ManagerID, e.Name
    FROM Employees e
    JOIN Reports r ON e.ManagerID = r.EmployeeID
)
SELECT * FROM Reports;

-- 8. Derived table: employees with most sales in last 6 months
SELECT e.Name, s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID
WHERE s.TotalSales = (
    SELECT MAX(SalesSum) FROM (
        SELECT SUM(SaleAmount) AS SalesSum
        FROM Sales
        WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
        GROUP BY EmployeeID
    ) sub
);

-- 9. Recursive CTE: calculate total order cost incl. tax & discount
WITH OrderTotal AS (
    SELECT OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS Subtotal
    FROM OrderDetails
    GROUP BY OrderID
)
SELECT o.OrderID, ot.Subtotal, ot.Subtotal * 1.1 AS TotalWithTax
FROM Orders o
JOIN OrderTotal ot ON o.OrderID = ot.OrderID;

-- 10. CTE: largest sales growth rate over past year
WITH SalesGrowth AS (
    SELECT s1.EmployeeID,
           SUM(s1.SaleAmount) AS CurrentYearSales,
           ISNULL(SUM(s2.SaleAmount), 0) AS PreviousYearSales
    FROM Sales s1
    LEFT JOIN Sales s2 ON s1.EmployeeID = s2.EmployeeID AND YEAR(s2.SaleDate) = YEAR(GETDATE()) - 1
    WHERE YEAR(s1.SaleDate) = YEAR(GETDATE())
    GROUP BY s1.EmployeeID
)
SELECT EmployeeID, CurrentYearSales, PreviousYearSales,
       (CurrentYearSales - PreviousYearSales) * 1.0 / NULLIF(PreviousYearSales, 0) AS GrowthRate
FROM SalesGrowth;

-- 11. Recursive CTE: total sales per employee across all years
WITH EmployeeSales AS (
    SELECT EmployeeID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT * FROM EmployeeSales;

-- 12. CTE + derived: highest-selling product and employee who sold it
WITH ProductSales AS (
    SELECT ProductID, EmployeeID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID, EmployeeID
), MaxSales AS (
    SELECT TOP 1 ProductID, EmployeeID, TotalSales
    FROM ProductSales
    ORDER BY TotalSales DESC
)
SELECT p.Name AS ProductName, e.Name AS EmployeeName, m.TotalSales
FROM MaxSales m
JOIN Products p ON m.ProductID = p.ProductID
JOIN Employees e ON m.EmployeeID = e.EmployeeID;

-- 13. Recursive CTE: generations in hierarchy
WITH OrgTree AS (
    SELECT EmployeeID, ManagerID, 1 AS Generation
    FROM Employees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.EmployeeID, e.ManagerID, o.Generation + 1
    FROM Employees e
    JOIN OrgTree o ON e.ManagerID = o.EmployeeID
)
SELECT * FROM OrgTree;

-- 14. CTE: employees with sales > department avg
WITH DeptAvg AS (
    SELECT DepartmentID, AVG(SaleAmount) AS DeptAvg
    FROM Employees e
    JOIN Sales s ON e.EmployeeID = s.EmployeeID
    GROUP BY DepartmentID
), EmpSales AS (
    SELECT e.EmployeeID, e.Name, e.DepartmentID, SUM(s.SaleAmount) AS EmpTotal
    FROM Employees e
    JOIN Sales s ON e.EmployeeID = s.EmployeeID
    GROUP BY e.EmployeeID, e.Name, e.DepartmentID
)
SELECT es.*
FROM EmpSales es
JOIN DeptAvg da ON es.DepartmentID = da.DepartmentID
WHERE es.EmpTotal > da.DeptAvg;

-- 15. Derived table: avg sales per employee by region
SELECT e.RegionID, AVG(s.TotalSales) AS AvgSalesPerEmployee
FROM (
    SELECT EmployeeID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) s
JOIN Employees e ON s.EmployeeID = e.EmployeeID
GROUP BY e.RegionID;

-- 16. Recursive CTE: report relationships to a manager
WITH EmployeeReports AS (
    SELECT EmployeeID, ManagerID
    FROM Employees
    WHERE ManagerID = @ManagerID
    UNION ALL
    SELECT e.EmployeeID, e.ManagerID
    FROM Employees e
    JOIN EmployeeReports r ON e.ManagerID = r.EmployeeID
)
SELECT * FROM EmployeeReports;

-- 17. CTE: average number of products sold by employee last year
WITH ProductsSold AS (
    SELECT EmployeeID, SUM(Quantity) AS TotalQty
    FROM OrderDetails od
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
    GROUP BY EmployeeID
)
SELECT * FROM ProductsSold;

-- 18. Derived + CTE: sales performance by employee & category
WITH SalesByEmpCat AS (
    SELECT e.EmployeeID, pc.CategoryID, SUM(s.SaleAmount) AS TotalSales
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    JOIN Products p ON s.ProductID = p.ProductID
    JOIN ProductCategories pc ON p.CategoryID = pc.CategoryID
    GROUP BY e.EmployeeID, pc.CategoryID
)
SELECT * FROM SalesByEmpCat;

-- 19. Recursive CTE: all departments under a parent
WITH DepartmentHierarchy AS (
    SELECT DepartmentID, ParentDepartmentID
    FROM Departments
    WHERE DepartmentID = @DepartmentID
    UNION ALL
    SELECT d.DepartmentID, d.ParentDepartmentID
    FROM Departments d
    JOIN DepartmentHierarchy dh ON d.ParentDepartmentID = dh.DepartmentID
)
SELECT * FROM DepartmentHierarchy;

-- 20. Recursive CTE: number of levels in product hierarchy
WITH CategoryLevels AS (
    SELECT CategoryID, ParentCategoryID, 1 AS Level
    FROM ProductCategories
    WHERE ParentCategoryID IS NULL
    UNION ALL
    SELECT pc.CategoryID, pc.ParentCategoryID, cl.Level + 1
    FROM ProductCategories pc
    JOIN CategoryLevels cl ON pc.ParentCategoryID = cl.CategoryID
)
SELECT MAX(Level) AS MaxHierarchyDepth FROM CategoryLevels;



