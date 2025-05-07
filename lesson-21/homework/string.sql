-- 1. Assign a row number to each sale based on SaleDate
SELECT SaleID, SaleDate, SaleAmount, ROW_NUMBER() OVER (ORDER BY SaleDate) AS RowNumber
FROM Sales;

-- 2. Rank products based on the total quantity sold, giving the same rank for the same amounts
SELECT ProductID, ProductName, TotalQuantitySold, RANK() OVER (ORDER BY TotalQuantitySold DESC) AS Rank
FROM Products
JOIN Sales ON Products.ProductID = Sales.ProductID
GROUP BY ProductID, ProductName;

-- 3. Identify the top sale for each customer based on SaleAmount
SELECT CustomerID, SaleID, SaleAmount
FROM Sales s
WHERE SaleAmount = (
    SELECT MAX(SaleAmount)
    FROM Sales
    WHERE CustomerID = s.CustomerID
);

-- 4. Display each sale's amount along with the next sale amount in the order of SaleDate
SELECT SaleID, SaleDate, SaleAmount,
       LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSaleAmount
FROM Sales;

-- 5. Display each sale's amount along with the previous sale amount in the order of SaleDate
SELECT SaleID, SaleDate, SaleAmount,
       LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PreviousSaleAmount
FROM Sales;

-- 6. Identify sales amounts that are greater than the previous sale's amount
SELECT SaleID, SaleAmount
FROM (
    SELECT SaleID, SaleAmount,
           LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PreviousSaleAmount
    FROM Sales
) AS SalesComparison
WHERE SaleAmount > PreviousSaleAmount;

-- 7. Calculate the difference in sale amount from the previous sale for every product
SELECT ProductID, SaleID, SaleAmount,
       SaleAmount - LAG(SaleAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS DiffFromPreviousSale
FROM Sales;

-- 8. Compare the current sale amount with the next sale amount in terms of percentage change
SELECT SaleID, SaleAmount,
       LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSaleAmount,
       CASE WHEN LEAD(SaleAmount) OVER (ORDER BY SaleDate) IS NOT NULL
            THEN (LEAD(SaleAmount) OVER (ORDER BY SaleDate) - SaleAmount) / SaleAmount * 100
            ELSE NULL
       END AS PercentageChange
FROM Sales;

-- 9. Calculate the ratio of the current sale amount to the previous sale amount within the same product
SELECT ProductID, SaleID, SaleAmount,
       SaleAmount / LAG(SaleAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS SaleAmountRatio
FROM Sales;

-- 10. Calculate the difference in sale amount from the very first sale of that product
SELECT ProductID, SaleID, SaleAmount,
       SaleAmount - FIRST_VALUE(SaleAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS DiffFromFirstSale
FROM Sales;

-- 11. Find sales that have been increasing continuously for a product
SELECT ProductID, SaleID, SaleAmount
FROM (
    SELECT ProductID, SaleID, SaleAmount,
           LAG(SaleAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS PreviousSaleAmount
    FROM Sales
) AS SalesComparison
WHERE SaleAmount > PreviousSaleAmount;

-- 12. Calculate a "closing balance" (running total) for sales amounts
SELECT ProductID, SaleID, SaleAmount,
       SUM(SaleAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS ClosingBalance
FROM Sales;

-- 13. Calculate the moving average of sales amounts over the last 3 sales
SELECT ProductID, SaleID, SaleAmount,
       AVG(SaleAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAvg
FROM Sales;

-- 14. Show the difference between each sale amount and the average sale amount
SELECT SaleID, SaleAmount,
       SaleAmount - AVG(SaleAmount) OVER () AS DifferenceFromAvg
FROM Sales;

-- 15. Find Employees Who Have the Same Salary Rank
SELECT Name, Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees1;

-- 16. Identify the Top 2 Highest Salaries in Each Department
SELECT Department, Salary
FROM (
    SELECT Department, Salary, DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
    FROM Employees1
) AS RankedSalaries
WHERE SalaryRank <= 2;

-- 17. Find the Lowest-Paid Employee in Each Department
SELECT Department, Name, Salary
FROM Employees1
WHERE Salary IN (
    SELECT MIN(Salary)
    FROM Employees1
    GROUP BY Department
);

-- 18. Calculate the Running Total of Salaries in Each Department
SELECT Department, Name, Salary,
       SUM(Salary) OVER (PARTITION BY Department ORDER BY HireDate) AS RunningTotalSalary
FROM Employees1;

-- 19. Find the Total Salary of Each Department Without GROUP BY
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees1
GROUP BY Department;

-- 20. Calculate the Average Salary in Each Department Without GROUP BY
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees1
GROUP BY Department;

-- 21. Find the Difference Between an Employee’s Salary and Their Department’s Average
SELECT Name, Department, Salary,
       Salary - (SELECT AVG(Salary) FROM Employees1 WHERE Department = e.Department) AS SalaryDifference
FROM Employees1 e;

-- 22. Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
SELECT Name, Salary,
       AVG(Salary) OVER (ORDER BY HireDate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS MovingAvgSalary
FROM Employees1;

-- 23. Find the Sum of Salaries for the Last 3 Hired Employees
SELECT SUM(Salary) AS TotalSalaryLast3Hired
FROM (
    SELECT TOP 3 Salary
    FROM Employees1
    ORDER BY HireDate DESC
) AS Last3Hired;
