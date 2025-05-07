-- Задача 1: Временная таблица MonthlySales
CREATE TABLE #MonthlySales (
    ProductID INT,
    TotalQuantity INT,
    TotalRevenue DECIMAL(18,2)
);

INSERT INTO #MonthlySales (ProductID, TotalQuantity, TotalRevenue)
SELECT 
    ProductID,
    SUM(Quantity) AS TotalQuantity,
    SUM(Quantity * Price) AS TotalRevenue
FROM Sales
WHERE MONTH(SaleDate) = MONTH(GETDATE()) AND YEAR(SaleDate) = YEAR(GETDATE())
GROUP BY ProductID;

-- Задача 2: Представление vw_ProductSalesSummary
CREATE VIEW vw_ProductSalesSummary AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(s.Quantity) AS TotalQuantitySold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category;

-- Задача 3: Скалярная функция fn_GetTotalRevenueForProduct
CREATE FUNCTION fn_GetTotalRevenueForProduct(@ProductID INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(18,2);
    SELECT @TotalRevenue = SUM(Quantity * Price)
    FROM Sales
    WHERE ProductID = @ProductID;
    RETURN @TotalRevenue;
END;

-- Задача 4: Скалярная функция fn_GetSalesByCategory
CREATE FUNCTION fn_GetSalesByCategory(@Category VARCHAR(50))
RETURNS TABLE
AS
RETURN
    SELECT 
        p.ProductName,
        SUM(s.Quantity) AS TotalQuantity,
        SUM(s.Quantity * s.Price) AS TotalRevenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
    WHERE p.Category = @Category
    GROUP BY p.ProductName;

-- Задача 5: Проверка на простое число
CREATE FUNCTION dbo.fn_IsPrime (@Number INT)
RETURNS VARCHAR(3)
AS
BEGIN
    IF @Number < 2 RETURN 'No';
    DECLARE @i INT = 2;
    WHILE @i <= SQRT(@Number)
    BEGIN
        IF @Number % @i = 0 RETURN 'No';
        SET @i = @i + 1;
    END
    RETURN 'Yes';
END;

-- Задача 6: Табличная функция для генерации диапазона чисел
CREATE FUNCTION fn_GetNumbersBetween(@Start INT, @End INT)
RETURNS @Result TABLE (Number INT)
AS
BEGIN
    DECLARE @Current INT = @Start;
    WHILE @Current <= @End
    BEGIN
        INSERT INTO @Result VALUES (@Current);
        SET @Current = @Current + 1;
    END
    RETURN;
END;

-- Задача 7: N-я по величине зарплата
CREATE FUNCTION getNthHighestSalary(@N INT)
RETURNS TABLE
AS
RETURN
    SELECT DISTINCT TOP 1 Salary AS HighestNSalary
    FROM (
        SELECT DISTINCT Salary
        FROM Employee
    ) AS DistinctSalaries
    ORDER BY Salary DESC
    OFFSET (@N - 1) ROWS;

-- Задача 8: Пользователь с наибольшим числом друзей
SELECT TOP 1 id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) AS AllFriends
GROUP BY id
ORDER BY COUNT(*) DESC;

-- Задача 9: Представление vw_CustomerOrderSummary
CREATE VIEW vw_CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS total_amount,
    MAX(o.order_date) AS last_order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Задача 10: Заполнение пропущенных значений
WITH Filled AS (
    SELECT *,
        MAX(Workflow) OVER (ORDER BY RowNumber ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS FilledWorkflow
    FROM WorkflowTable
)
SELECT RowNumber, FilledWorkflow AS Workflow
FROM Filled;
