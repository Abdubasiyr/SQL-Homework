-- EASY TASKS
-- 1. Numbers from 1 to 1000
WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < 1000
)
SELECT * INTO #Numbers FROM Numbers
OPTION (MAXRECURSION 1000);

-- 2. Total sales per employee
SELECT e.EmployeeID, e.Name, s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID;

-- 3. Average salary using CTE
WITH AvgSalary AS (
    SELECT AVG(Salary) AS AvgSal FROM Employees
)
SELECT * FROM AvgSalary;

-- 4. Highest sales per product using derived table
SELECT p.ProductID, p.ProductName, s.MaxSale
FROM Products p
JOIN (
    SELECT ProductID, MAX(Amount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
) s ON p.ProductID = s.ProductID;

-- 5. Double number until < 1,000,000
WITH Doubled AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n * 2 FROM Doubled WHERE n * 2 < 1000000
)
SELECT * FROM Doubled;

-- 6. Employees with more than 5 sales
WITH SalesCount AS (
    SELECT EmployeeID, COUNT(*) AS SaleCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.EmployeeID, e.Name
FROM Employees e
JOIN SalesCount s ON e.EmployeeID = s.EmployeeID
WHERE s.SaleCount > 5;

-- 7. Products with sales > $500
WITH ProductSales AS (
    SELECT ProductID, SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
)
SELECT p.ProductID, p.ProductName
FROM Products p
JOIN ProductSales ps ON p.ProductID = ps.ProductID
WHERE ps.TotalSales > 500;

-- 8. Employees with salary above average
WITH AvgSalary2 AS (
    SELECT AVG(Salary) AS AvgSal FROM Employees
)
SELECT * FROM Employees
WHERE Salary > (SELECT AvgSal FROM AvgSalary2);

-- MEDIUM TASKS
-- 9. Top 5 employees by number of orders
SELECT TOP 5 e.EmployeeID, e.Name, s.OrderCount
FROM Employees e
JOIN (
    SELECT EmployeeID, COUNT(*) AS OrderCount
    FROM Sales
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID
ORDER BY s.OrderCount DESC;

-- 10. Sales per product category
SELECT p.Category, SUM(s.Amount) AS TotalSales
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.Category;

-- 11. Factorial per number from Numbers1
WITH Factorial(n, fact) AS (
    SELECT 1, 1
    UNION ALL
    SELECT n + 1, fact * (n + 1)
    FROM Factorial
    WHERE n < (SELECT MAX(Number) FROM Numbers1)
)
SELECT * FROM Factorial
WHERE n IN (SELECT Number FROM Numbers1);

-- 12. Split string into characters
WITH SplitString AS (
    SELECT 1 AS pos, SUBSTRING(String, 1, 1) AS char, String
    FROM Example
    UNION ALL
    SELECT pos + 1, SUBSTRING(String, pos + 1, 1), String
    FROM SplitString
    WHERE pos + 1 <= LEN(String)
)
SELECT String, char FROM SplitString;

-- 13. Sales difference by month
WITH MonthlySales AS (
    SELECT FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth, SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY FORMAT(SaleDate, 'yyyy-MM')
),
Diffs AS (
    SELECT SaleMonth,
           TotalSales,
           LAG(TotalSales) OVER (ORDER BY SaleMonth) AS PrevMonthSales
    FROM MonthlySales
)
SELECT *, TotalSales - PrevMonthSales AS Difference FROM Diffs;

-- 14. Employees with quarterly sales > $45000
SELECT e.EmployeeID, e.Name, s.Quarter, s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID,
           DATEPART(QUARTER, SaleDate) AS Quarter,
           SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
    HAVING SUM(Amount) > 45000
) s ON e.EmployeeID = s.EmployeeID;

-- DIFFICULT TASKS
-- 15. Fibonacci numbers with recursion
WITH Fibonacci(n, val) AS (
    SELECT 1, 0
    UNION ALL
    SELECT 2, 1
    UNION ALL
    SELECT n + 1, 
           (SELECT val FROM Fibonacci f1 WHERE f1.n = Fibonacci.n - 1) +
           (SELECT val FROM Fibonacci f2 WHERE f2.n = Fibonacci.n - 2)
    FROM Fibonacci
    WHERE n < 20
)
SELECT * FROM Fibonacci;

-- 16. Strings where all characters are the same
SELECT *
FROM FindSameCharacters
WHERE LEN(Name) > 1 AND LEN(REPLACE(Name, LEFT(Name, 1), '')) = 0;

-- 17. 1 → 12 → 123 → … до n
DECLARE @n INT = 5;
WITH Sequence AS (
    SELECT 1 AS Level, CAST('1' AS VARCHAR(100)) AS Seq
    UNION ALL
    SELECT Level + 1, Seq + CAST(Level + 1 AS VARCHAR)
    FROM Sequence
    WHERE Level + 1 <= @n
)
SELECT * FROM Sequence;

-- 18. Employees with highest sales in last 6 months
SELECT e.EmployeeID, e.Name, s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(Amount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID
WHERE s.TotalSales = (
    SELECT MAX(TotalSales) FROM (
        SELECT EmployeeID, SUM(Amount) AS TotalSales
        FROM Sales
        WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
        GROUP BY EmployeeID
    ) t
);

-- 19. Remove duplicate integers and single digits from string
-- (assuming space-separated values)
WITH Split AS (
    SELECT value, COUNT(*) OVER (PARTITION BY value) AS cnt
    FROM (
        SELECT TRIM(value) AS value
        FROM RemoveDuplicateIntsFromNames
        CROSS APPLY STRING_SPLIT(StringColumn, ' ')
    ) x
)
SELECT DISTINCT value
FROM Split
WHERE LEN(value) > 1 AND cnt = 1;
