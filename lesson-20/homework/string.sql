-- 1. Find customers who purchased at least one item in March 2024 using EXISTS
SELECT DISTINCT o.CustomerID
FROM #Orders o
WHERE EXISTS (
    SELECT 1
    FROM #Orders o2
    WHERE o.CustomerID = o2.CustomerID
    AND MONTH(o2.OrderDate) = 3 AND YEAR(o2.OrderDate) = 2024
);

-- 2. Find the product with the highest total sales revenue using a subquery
SELECT p.ProductID, p.Name, p.Price
FROM Products p
WHERE p.ProductID = (
    SELECT TOP 1 o.ProductID
    FROM Orders o
    GROUP BY o.ProductID
    ORDER BY SUM(o.Quantity * p.Price) DESC
);

-- 3. Find the second highest sale amount using a subquery
SELECT MAX(SalesAmount) AS SecondHighestSale
FROM #EmployeeSales
WHERE SalesAmount < (
    SELECT MAX(SalesAmount)
    FROM #EmployeeSales
);

-- 4. Find the total quantity of products sold per month using a subquery
SELECT MONTH(OrderDate) AS SaleMonth, SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY MONTH(OrderDate);

-- 5. Find customers who bought the same products as another customer using EXISTS
SELECT DISTINCT o1.CustomerID
FROM Orders o1
WHERE EXISTS (
    SELECT 1
    FROM Orders o2
    WHERE o1.ProductID = o2.ProductID
    AND o1.CustomerID <> o2.CustomerID
);

-- 6. Return how many fruits each person has in individual fruit level
SELECT Name,
       SUM(CASE WHEN Fruit = 'Apple' THEN 1 ELSE 0 END) AS Apple,
       SUM(CASE WHEN Fruit = 'Orange' THEN 1 ELSE 0 END) AS Orange,
       SUM(CASE WHEN Fruit = 'Banana' THEN 1 ELSE 0 END) AS Banana
FROM Fruits
GROUP BY Name;

-- 7. Return older people in the family with younger ones
SELECT f.ParentId AS PID, f.ChildID AS CHID
FROM Family f
WHERE EXISTS (
    SELECT 1
    FROM Family f2
    WHERE f.ParentId = f2.ParentId AND f.ChildID <> f2.ChildID
);

-- 8. Write an SQL statement for customers who had a delivery to California, return orders delivered to Texas
SELECT o.CustomerID, o.OrderID, o.DeliveryState, o.Amount
FROM #Orders o
WHERE o.CustomerID IN (
    SELECT DISTINCT CustomerID
    FROM #Orders
    WHERE DeliveryState = 'CA'
)
AND o.DeliveryState = 'TX';

-- 9. Insert the names of residents if they are missing
UPDATE #residents
SET fullname = COALESCE(NULLIF(fullname, ''), 'Missing Name')
WHERE fullname IS NULL;

-- 10. Query to return the route from Tashkent to Khorezm, cheapest and most expensive
WITH RoutePaths AS (
    SELECT r.DepartureCity, r.ArrivalCity, r.Cost,
           r.DepartureCity + ' - ' + r.ArrivalCity AS Route
    FROM #Routes r
    WHERE r.DepartureCity = 'Tashkent' AND r.ArrivalCity = 'Khorezm'
    UNION
    SELECT r1.DepartureCity, r1.ArrivalCity, r1.Cost + r2.Cost AS Cost,
           r1.DepartureCity + ' - ' + r2.ArrivalCity AS Route
    FROM #Routes r1
    JOIN #Routes r2 ON r1.ArrivalCity = r2.DepartureCity
    WHERE r1.DepartureCity = 'Tashkent' AND r2.ArrivalCity = 'Khorezm'
)
SELECT Route, Cost FROM RoutePaths
WHERE Cost = (SELECT MIN(Cost) FROM RoutePaths)
   OR Cost = (SELECT MAX(Cost) FROM RoutePaths);

-- 11. Rank products based on their order of insertion
SELECT ID, Vals, ROW_NUMBER() OVER (ORDER BY ID) AS Rank
FROM #RankingPuzzle;

-- 12. Find employees whose sales were higher than the average sales in their department
SELECT es.EmployeeName, es.Department, es.SalesAmount
FROM #EmployeeSales es
WHERE es.SalesAmount > (
    SELECT AVG(SalesAmount)
    FROM #EmployeeSales
    WHERE Department = es.Department
);

-- 13. Find employees who had the highest sales in any given month using EXISTS
SELECT es.EmployeeName, es.SalesMonth, es.SalesYear
FROM #EmployeeSales es
WHERE EXISTS (
    SELECT 1
    FROM #EmployeeSales es2
    WHERE es.SalesMonth = es2.SalesMonth
    AND es.SalesYear = es2.SalesYear
    AND es.SalesAmount = (
        SELECT MAX(SalesAmount)
        FROM #EmployeeSales
        WHERE SalesMonth = es.SalesMonth AND SalesYear = es.SalesYear
    )
);

-- 14. Find employees who made sales in every month using NOT EXISTS
SELECT es.EmployeeName
FROM #EmployeeSales es
WHERE NOT EXISTS (
    SELECT 1
    FROM #EmployeeSales es2
    WHERE es.EmployeeID = es2.EmployeeID
    AND es2.SalesMonth <> es.SalesMonth
);

-- 15. Retrieve the names of products that are more expensive than the average price of all products
SELECT Name
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

-- 16. Find the products that have a stock count lower than the highest stock count
SELECT Name
FROM Products
WHERE Stock < (SELECT MAX(Stock) FROM Products);

-- 17. Get the names of products that belong to the same category as 'Laptop'
SELECT Name
FROM Products
WHERE Category = (SELECT Category FROM Products WHERE Name = 'Laptop');

-- 18. Retrieve products whose price is greater than the lowest price in the Electronics category
SELECT Name
FROM Products
WHERE Price > (SELECT MIN(Price) FROM Products WHERE Category = 'Electronics');

-- 19. Find the products that have a higher price than the average price of their respective category
SELECT Name
FROM Products p
WHERE p.Price > (
    SELECT AVG(Price)
    FROM Products
    WHERE Category = p.Category
);

-- 20. Find the products that have been ordered at least once
SELECT DISTINCT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID;

-- 21. Retrieve the names of products that have been ordered more than the average quantity ordered
SELECT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
HAVING SUM(o.Quantity) > (SELECT AVG(Quantity) FROM Orders);

-- 22. Find the products that have never been ordered
SELECT p.Name
FROM Products p
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.ProductID = p.ProductID
);

-- 23. Retrieve the product with the highest total quantity ordered
SELECT TOP 1 p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
ORDER BY SUM(o.Quantity) DESC;
