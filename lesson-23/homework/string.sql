-- 1. Общий доход от всех продаж
SELECT SUM(QuantitySold * UnitPrice) AS TotalRevenue
FROM Sales;

-- 2. Средняя цена за единицу товара
SELECT AVG(UnitPrice) AS AverageUnitPrice
FROM Sales;

-- 3. Количество записей о продажах
SELECT COUNT(*) AS TotalSalesTransactions
FROM Sales;

-- 4. Наибольшее количество единиц, проданных в одной транзакции
SELECT MAX(QuantitySold) AS MaxUnitsSold
FROM Sales;

-- 5. Количество продуктов, проданных в каждой категории
SELECT Category, SUM(QuantitySold) AS TotalSold
FROM Sales
GROUP BY Category;

-- 6. Общий доход по регионам
SELECT Region, SUM(QuantitySold * UnitPrice) AS TotalRevenueByRegion
FROM Sales
GROUP BY Region;

-- 7. Продукт с наибольшим общим доходом
SELECT TOP 1 Product, SUM(QuantitySold * UnitPrice) AS TotalRevenue
FROM Sales
GROUP BY Product
ORDER BY TotalRevenue DESC;

-- 8. Текущий итоговый доход, отсортированный по дате продажи
SELECT SaleDate, SUM(QuantitySold * UnitPrice) OVER (ORDER BY SaleDate) AS RunningTotalRevenue
FROM Sales;

-- 9. Вклад каждой категории в общий доход
SELECT Category, SUM(QuantitySold * UnitPrice) AS RevenueByCategory,
       SUM(QuantitySold * UnitPrice) * 100.0 / (SELECT SUM(QuantitySold * UnitPrice) FROM Sales) AS CategoryPercentage
FROM Sales
GROUP BY Category;

-- 10. Все продажи с соответствующими именами покупателей
SELECT s.SaleID, s.Product, s.QuantitySold, s.UnitPrice, s.SaleDate, s.Region, s.CustomerID, c.CustomerName
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID;

-- 11. Покупатели, которые не совершили покупок
SELECT c.CustomerID, c.CustomerName
FROM Customers c
LEFT JOIN Sales s ON c.CustomerID = s.CustomerID
WHERE s.CustomerID IS NULL;

-- 12. Общий доход от каждого покупателя
SELECT s.CustomerID, SUM(s.QuantitySold * s.UnitPrice) AS TotalRevenueFromCustomer
FROM Sales s
GROUP BY s.CustomerID;

-- 13. Покупатель, который внес наибольший вклад в доход
SELECT TOP 1 s.CustomerID, SUM(s.QuantitySold * s.UnitPrice) AS TotalRevenueFromCustomer
FROM Sales s
GROUP BY s.CustomerID
ORDER BY TotalRevenueFromCustomer DESC;

-- 14. Общие продажи по каждому покупателю
SELECT s.CustomerID, SUM(s.QuantitySold) AS TotalSalesPerCustomer
FROM Sales s
GROUP BY s.CustomerID;

-- 15. Список всех продуктов, которые были проданы хотя бы один раз
SELECT DISTINCT p.ProductName
FROM Products p
JOIN Sales s ON p.ProductName = s.Product;

-- 16. Самый дорогой продукт
SELECT TOP 1 ProductName, SellingPrice
FROM Products
ORDER BY SellingPrice DESC;

-- 17. Продукты, где цена продажи выше средней цены продажи в их категории
SELECT p.ProductName, p.SellingPrice, p.Category
FROM Products p
WHERE p.SellingPrice > (
    SELECT AVG(SellingPrice)
    FROM Products
    WHERE Category = p.Category
);
