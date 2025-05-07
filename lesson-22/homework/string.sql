-- 1. Compute Running Total Sales per Customer
SELECT CustomerID, SaleDate, SaleAmount,
       SUM(SaleAmount) OVER (PARTITION BY CustomerID ORDER BY SaleDate) AS RunningTotalSales
FROM Sales;

-- 2. Count the Number of Orders per Product Category
SELECT ProductCategory, COUNT(*) AS OrderCount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY ProductCategory;

-- 3. Find the Maximum Total Amount per Product Category
SELECT ProductCategory, MAX(SaleAmount) AS MaxSaleAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY ProductCategory;

-- 4. Find the Minimum Price of Products per Product Category
SELECT ProductCategory, MIN(Price) AS MinPrice
FROM Products
GROUP BY ProductCategory;

-- 5. Compute the Moving Average of Sales of 3 days (prev day, curr day, next day)
SELECT SaleID, SaleDate, SaleAmount,
       AVG(SaleAmount) OVER (ORDER BY SaleDate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS MovingAvg
FROM Sales;

-- 6. Find the Total Sales per Region
SELECT Region, SUM(SaleAmount) AS TotalSales
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
GROUP BY Region;

-- 7. Compute the Rank of Customers Based on Their Total Purchase Amount
SELECT CustomerID, SUM(SaleAmount) AS TotalAmount,
       RANK() OVER (ORDER BY SUM(SaleAmount) DESC) AS Rank
FROM Sales
GROUP BY CustomerID;

-- 8. Calculate the Difference Between Current and Previous Sale Amount per Customer
SELECT SaleID, CustomerID, SaleAmount,
       SaleAmount - LAG(SaleAmount) OVER (PARTITION BY CustomerID ORDER BY SaleDate) AS DiffFromPreviousSale
FROM Sales;

-- 9. Find the Top 3 Most Expensive Products in Each Category
SELECT ProductCategory, ProductID, ProductName, Price,
       RANK() OVER (PARTITION BY ProductCategory ORDER BY Price DESC) AS ProductRank
FROM Products
WHERE ProductRank <= 3;

-- 10. Compute the Cumulative Sum of Sales Per Region by Order Date
SELECT Region, SaleDate, SaleAmount,
       SUM(SaleAmount) OVER (PARTITION BY Region ORDER BY SaleDate) AS CumulativeSales
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID;

-- 11. Compute Cumulative Revenue per Product Category
SELECT ProductCategory, SaleDate, SaleAmount,
       SUM(SaleAmount) OVER (PARTITION BY ProductCategory ORDER BY SaleDate) AS CumulativeRevenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID;

-- 12. Sum of Previous Values (SumPreValues)
WITH CTE AS (
    SELECT Value, SUM(Value) OVER (ORDER BY Value ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) AS SumPreValues
    FROM OneColumn
)
SELECT Value, COALESCE(SumPreValues, Value) AS SumPreValues
FROM CTE;

-- 13. Sum of Previous Values to Current Value (TheSumPuzzle)
SELECT Id, SUM(Cost) AS TotalCost, SUM(Quantity) AS TotalQuantity
FROM TheSumPuzzle
GROUP BY Id;

-- 14. Generate row numbers for the given data where the first row number is odd
SELECT Id, Vals,
       ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Id) * 2 - 1 AS RowNumber
FROM Row_Nums;

-- 15. Find customers who have purchased items from more than one product_category
SELECT CustomerID
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY CustomerID
HAVING COUNT(DISTINCT p.ProductCategory) > 1;

-- 16. Find Customers with Above-Average Spending in Their Region
SELECT CustomerID, Region, SUM(SaleAmount) AS TotalSpending
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
GROUP BY CustomerID, Region
HAVING SUM(SaleAmount) > (SELECT AVG(SaleAmount) FROM Sales WHERE Region = c.Region);

-- 17. Rank customers based on their total spending (total_amount) within each region, without skipping ranks
SELECT CustomerID, SUM(SaleAmount) AS TotalAmount, Region,
       DENSE_RANK() OVER (PARTITION BY Region ORDER BY SUM(SaleAmount) DESC) AS Rank
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
GROUP BY CustomerID, Region;

-- 18. Calculate the running total (cumulative_sales) of total_amount for each customer_id, ordered by order_date
SELECT CustomerID, SaleDate, SaleAmount,
       SUM(SaleAmount) OVER (PARTITION BY CustomerID ORDER BY SaleDate) AS CumulativeSales
FROM Sales;

-- 19. Calculate the sales growth rate (growth_rate) for each month compared to the previous month
WITH MonthlySales AS (
    SELECT YEAR(SaleDate) AS SaleYear, MONTH(SaleDate) AS SaleMonth, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY YEAR(SaleDate), MONTH(SaleDate)
)
SELECT SaleYear, SaleMonth, TotalSales,
       (TotalSales - LAG(TotalSales) OVER (ORDER BY SaleYear, SaleMonth)) / LAG(TotalSales) OVER (ORDER BY SaleYear, SaleMonth) * 100 AS GrowthRate
FROM MonthlySales;

-- 20. Identify customers whose total_amount is higher than their last order's total_amount
WITH LastSale AS (
    SELECT CustomerID, SaleAmount,
           ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY SaleDate DESC) AS SaleRank
    FROM Sales
)
SELECT CustomerID, SaleAmount
FROM LastSale
WHERE SaleRank = 1
AND SaleAmount > (SELECT SaleAmount FROM LastSale WHERE CustomerID = LastSale.CustomerID AND SaleRank = 2);

-- 21. Identify Products that prices are above the average product price
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

-- 22. Sum of val1 and val2 for each group, put that value at the beginning of the group in the new column (MyData)
SELECT Id, Grp, Val1, Val2,
       CASE WHEN Id = MIN(Id) OVER (PARTITION BY Grp) THEN (Val1 + Val2) ELSE NULL END AS Tot
FROM MyData;

-- 23. Sum up the value of the cost column based on the values of Id in TheSumPuzzle
SELECT Id, SUM(Cost) AS TotalCost, SUM(Quantity) AS TotalQuantity
FROM TheSumPuzzle
GROUP BY Id;

-- 24. Find gaps in Seat Numbers (Seats)
WITH SeatGaps AS (
    SELECT SeatNumber, LEAD(SeatNumber) OVER (ORDER BY SeatNumber) AS NextSeatNumber
    FROM Seats
)
SELECT SeatNumber + 1 AS GapStart, NextSeatNumber - 1 AS GapEnd
FROM SeatGaps
WHERE NextSeatNumber - SeatNumber > 1;
